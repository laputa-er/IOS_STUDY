//
//  ViewController.m
//  L03设计文本横向渐变消失的控件
//
//  Created by TonyEarth on 16/4/6.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "FadeStringUIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    // 创建 FadeStringUIView 实例
    FadeStringUIView *fadeString = [[FadeStringUIView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    fadeString.text = @"如果一个人不按照他想的方式活，那么很快就会按照他活的方式想。";
    fadeString.center = self.view.center;
    [self.view addSubview:fadeString];
    
    // 执行动画效果
    [fadeString fadeRightWithDuration:3.f animated:YES];
}

@end
