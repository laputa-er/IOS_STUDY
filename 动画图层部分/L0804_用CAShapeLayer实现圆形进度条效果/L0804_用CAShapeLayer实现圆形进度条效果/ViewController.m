//
//  ViewController.m
//  L0804_用CAShapeLayer实现圆形进度条效果
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "CircleUIView.h"

@interface ViewController ()
{
    CircleUIView *circle;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 1. 创建并设置圆型进度条
    circle = [[CircleUIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    circle.center = self.view.center;
    circle.startValue = 0.f;
    circle.lineWidth = 3.f;
    circle.lineColor = [UIColor grayColor];
    
    // 2. 添加并显示
    [self.view addSubview:circle];
    
    // 3. 延迟3秒后动画
    [self performSelector:@selector(delayAnimation)
               withObject:nil
               afterDelay:3.f];
}

/**
 *  设置圆型进度
 */
- (void)delayAnimation
{
    // 使进度达到100%
    circle.value = 1.f;
}
@end
