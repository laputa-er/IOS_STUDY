//
//  ViewController.m
//  L01动画中的高內聚低耦合
//
//  Created by TonyEarth on 16/4/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "LineUIView.h"
@interface ViewController ()
@property (nonatomic, strong) LineUIView *lineUIView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testLineAnimate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  使用封装在LineUIView中的动画效果
 */
- (void)testLineAnimate
{
    // 创建封装着动画效果的视图实例
    self.lineUIView = [[LineUIView alloc] initWithFrame:CGRectMake(10, 200, 100, 3)];
    // 设置初始状态
    self.lineUIView.offsetX = 50.f;
    self.lineUIView.backgroundColor = [UIColor blackColor];
    // 添加到当前视图中
    [self.view addSubview:self.lineUIView];
    // 展现带有动画的视图（展现带有动画）
    [self.lineUIView show];
    // 3秒中后隐藏视图（带消失有动画）
    [self performSelector:@selector(excuteAfterDelay) withObject:nil afterDelay:3];
}

- (void)excuteAfterDelay
{
    [self.lineUIView hide];
}
@end
