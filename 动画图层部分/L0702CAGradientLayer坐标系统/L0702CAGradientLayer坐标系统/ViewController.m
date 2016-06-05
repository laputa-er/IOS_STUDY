//
//  ViewController.m
//  L0702CAGradientLayer坐标系统
//
//  Created by TonyEarth on 16/4/11.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 1. 创建并初始化 CAGradientLayer 实例
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = CGRectMake(0, 0, 200, 200);
    self.gradientLayer.position = self.view.center;
    self.gradientLayer.borderWidth = 1.f;
    [self.view.layer addSublayer:self.gradientLayer];// 添加到视图
    
    // 2. 渐变效果相关设置
    // 颜色
    self.gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                                (__bridge id)[UIColor greenColor].CGColor,
                                (__bridge id)[UIColor blueColor].CGColor];
    // 渐变方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 0);
    
    // 分割点
    self.gradientLayer.locations = @[@(0.25), @(0.5), @(0.75)];
    
    // 3. 动画:3秒后修改分割点
    [self performSelector:@selector(gradientLayerLocationLocationAnimation)
               withObject:nil
               afterDelay:3.f];
}

/**
 *  修改分割点
 */
- (void)gradientLayerLocationLocationAnimation
{
    // 颜色分割点效果
    self.gradientLayer.locations = @[@(0.01), @(0.5), @(0.99)];
}

@end
