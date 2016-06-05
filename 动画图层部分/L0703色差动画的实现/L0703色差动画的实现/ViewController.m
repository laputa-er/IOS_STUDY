//
//  ViewController.m
//  L0703色差动画的实现
//
//  Created by TonyEarth on 16/4/11.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;// 渐变图层
@property (nonatomic, strong) NSTimer *timer;// 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 1. 创建 UIImage 实例（作为背景）
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    imageView.center = self.view.center;
    
    // 2. 初始化渐变图层
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = imageView.bounds;
    // 渐变方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    // 颜色组
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor redColor].CGColor];
    self.gradientLayer.locations = @[@(0.5f), @(1.f)];
    
    // 3. 组合背景和渐变图层
    [self.view addSubview:imageView];
    [imageView.layer addSublayer:self.gradientLayer];
    
    // 4. 初始化定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
}

/**
 *  刷新颜色组合分割点，从而制造动画效果
 */
- (void)timerEvent
{
    // 获取一组随机产生的颜色组
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor colorWithRed:arc4random() % 255 / 255.f
                                                               green:arc4random() % 255 /  255.f
                                                                blue:arc4random() % 255 / 255.f
                                                               alpha:1].CGColor];
    // 获取随机产生的分割点
    self.gradientLayer.locations = @[@(arc4random() % 10 / 10.f), @(1.f)];
}
@end
