//
//  ViewController.m
//  L09图片自动播放
//
//  Created by TonyEarth on 16/3/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height// 屏幕高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width// 屏幕高度

CGFloat kImgCount = 10;// 图片总数
CGFloat scrollY = 20;// 上边距
CGFloat pageCtrlWidth = 200;// 滚动指示器宽度

//--------- 扩展
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageCtrl;
@property (nonatomic, strong) NSTimer *timer;

@end

//---------- 实现
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initScrollView];
    [self initPageControl];
    [self addTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  创建并初始化 UIScrollView
 */
- (void)initScrollView
{
    // 创建 UIScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, scrollY, kScreenWidth, kScreenHeight - scrollY)];
    // 设置代理对象
    self.scrollView.delegate = self;
    // 初始化所有滚动的屏的内容
    for (int i = 0; i < kImgCount; i++) {
        UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, scrollY, kScreenWidth, kScreenHeight - scrollY)];
        imgview.image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%d", i + 1]];
        [self.scrollView addSubview:imgview];
    }
    // 设置 UIScrollView
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * kImgCount, kScreenHeight - scrollY);
    self.scrollView.pagingEnabled = YES;// 使滚动操作停止在恰当的位置
    [self.view addSubview:self.scrollView];// 添加到视图
}

/**
 *  创建并初始化 UIPageControl
 */
- (void)initPageControl
{
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth - pageCtrlWidth) / 2, kScreenHeight - scrollY, pageCtrlWidth, scrollY)];
    self.pageCtrl.numberOfPages = kImgCount;
    self.pageCtrl.pageIndicatorTintColor = [UIColor greenColor];
    self.pageCtrl.currentPageIndicatorTintColor = [UIColor yellowColor];
    [self.view insertSubview:self.pageCtrl aboveSubview:self.scrollView];// 添加到视图
}

/**
 *  自动滚动到下一屏
 */
- (void)nextPage
{
    NSInteger page = self.pageCtrl.currentPage;
    page++;
    if (page == kImgCount) {
        page = 0;
    }
    CGPoint point = CGPointMake(kScreenWidth * page, 0);
    [self.scrollView setContentOffset:point animated:YES];
}

/**
 *  设置延时反复
 */
- (void)addTimer
{
    // 创建 timer (interval)
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  清除延时反复
 */
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma  mark -UIScrollViewDelegae
// 滑动前：清除计时器
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
    NSLog(@"BeginDragging");
}
// 滑动中：更改指示器
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / kScreenWidth + 0.5;
    self.pageCtrl.currentPage = page;
}
// 滑动后：开始下一次互动倒计时
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 2秒钟后重新开始自动滚屏
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer];
    });
    NSLog(@"EndDragging");
}
@end
