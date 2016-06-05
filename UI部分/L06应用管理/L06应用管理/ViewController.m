//
//  ViewController.m
//  L06应用管理
//
//  Created by baidu on 16/2/29.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "JKAppInfo.h"
#import "JKAppView.h"

// 屏幕高度
#define kScreenH [UIScreen mainScreen].bounds.size.height
// 屏幕高度
#define kScreenW [UIScreen mainScreen].bounds.size.width
// 每个下载项的高度
#define kAppViewH [JKAppView appView].bounds.size.height
// 每个下载项的宽度
#define kAppViewW [JKAppView appView].bounds.size.width
// 分3列
#define kTotaoCol 3

@interface ViewController () <JKAppViewDelegate>

@property (nonatomic, strong) NSArray *appViews;

@end

@implementation ViewController

// 根据plist初始化所有的小view（懒加载）
- (NSArray *)appViews
{
    if (!_appViews) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            JKAppInfo *appInfo = [JKAppInfo appInfoWithDict:dict];
            JKAppView *appView = [JKAppView appView];
            appView.appInfo = appInfo;
            appView.delegate = self;
            
            [arrayM addObject:appView];
        }
        _appViews = [arrayM copy];
    }
    return _appViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 间距
    CGFloat margin = (kScreenW - kTotaoCol * kAppViewW) / (kTotaoCol + 1);
    // 确定每个自定义视图在父视图中的位置并添加到父视图中
    for (int i = 0; i < self.appViews.count; i++) {
        JKAppView *appView = self.appViews[i];
        
        int col = i % kTotaoCol;
        int row = i / kTotaoCol;
        
        CGFloat centerX = (margin + kAppViewW * 0.5) + (margin + kAppViewW) * col;
        CGFloat centerY = (margin + kAppViewH * 0.5) + (margin + kAppViewH) * row;
        // 设置中心点
        appView.center = CGPointMake(centerX, centerY);
        [self.view addSubview:appView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JKAppViewDelegate
- (void)downloadClickWithBtn:(UIButton *)btn
{
    // 1. 获取要下载的应用的名字
    JKAppView *appView = (JKAppView *)btn.superview;
    NSString *appName = appView.appInfo.name;
    
    // 2. 创建加载提示窗
    UIActivityIndicatorView *juhua = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];// 样式
    juhua.frame = self.view.bounds;// 尺寸
    [juhua startAnimating];
    [self.view addSubview:juhua];// 将提示窗添加到视图中
    
    // 3. 创建下载中文案
    UILabel *downloadLabel = [[UILabel alloc] init];
    downloadLabel.frame = CGRectMake(0, kScreenH * 0.5 + 10, kScreenW, 20);
    
    downloadLabel.textColor = [UIColor whiteColor];
    downloadLabel.textAlignment = NSTextAlignmentCenter;
    downloadLabel.text = [NSString stringWithFormat:@"%@正在下载...", appName];
    downloadLabel.font = [UIFont systemFontOfSize:15.0];
    
    downloadLabel.backgroundColor = [UIColor blackColor];
    downloadLabel.alpha = 0.5;
    
    [juhua addSubview:downloadLabel];// 将文案添加到加载窗上
    // 4. 设置两秒钟后完成下载
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        // 加载窗停止转动，并且自动隐藏
        [juhua stopAnimating];
        
        // 下载完成的提示
        UILabel *noteLabel = [[UILabel alloc] init];
        noteLabel.frame = CGRectMake(0, kScreenH * 0.5 + 10, kScreenW, 30);
        
        noteLabel.textColor = [UIColor whiteColor];
        noteLabel.textAlignment = NSTextAlignmentCenter;
        noteLabel.text = [NSString stringWithFormat:@"%@下载完成", appName];
        
        noteLabel.backgroundColor = [UIColor blackColor];
        noteLabel.alpha = 0.5;
        [self.view addSubview:noteLabel];
        // 延时操作与块动画
        [UIView animateWithDuration:2.0 animations:^{
            // 执行动画
            noteLabel.alpha = 1;
        } completion:^(BOOL finished) {
            // 动画完成后需要做的事情
            btn.enabled = NO;
            [btn setTitle:@"已下载" forState: UIControlStateDisabled];
            [noteLabel removeFromSuperview];
        }];
    });
}

@end
