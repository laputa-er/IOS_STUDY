//
//  ViewController.m
//  L02设计动画函数的主意事项
//
//  Created by TonyEarth on 16/4/3.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "LineUIView.h"

@interface ViewController ()
@property (nonatomic, strong) LineUIView *lineView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建动画视图
    self.lineView = [[LineUIView alloc] initWithFrame:CGRectMake(10, 100, 100, 3)];
    // 设置动画视图
    self.lineView.backgroundColor = [UIColor redColor];
    self.lineView.offSetX = self.view.frame.size.width / 2;
    [self.lineView buildView];// 初始化视图成员
    
    // 将动画视图添加到当前视图
    [self.view addSubview:self.lineView];
    // 显示
    [self delayShow];
    // 隐藏
    [self delayHide];
}

- (void)delayShow
{
    [self.lineView showWithDuration:3.f animated:YES];
}

- (void)delayHide
{
    [self.lineView hideWithDuration:3.f animated:YES];
}

@end
