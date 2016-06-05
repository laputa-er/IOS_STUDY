//
//  ViewController.m
//  L0502缓动函数与关键帧动画的联系
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "YXEasing.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 初始化显示用的view
    self.showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.showView.layer.cornerRadius = 50;
    self.showView.layer.masksToBounds = YES;
    self.showView.backgroundColor = [UIColor redColor];

    // 添加到当前视图中
    [self.view addSubview:self.showView];
    
    // 基本动画
    // [self baseAnimation];
    
    // 关键帧动画
    [self keyFrameAnimation];
}

/**
 *  基本动画
 */
- (void)baseAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"position";
    basicAnimation.duration = 2.f;
    // fromValue = A, toValue = B
    basicAnimation.fromValue = [NSValue valueWithCGPoint:self.showView.center];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 200)];

    self.showView.center = CGPointMake(300, 200);// 真正目标位置
    [self.showView.layer addAnimation:basicAnimation forKey:nil];
}

/**
 *  关键帧动画
 */
- (void)keyFrameAnimation
{
    // 1. 创建关键帧动画
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    keyFrameAnimation.duration = 1.f;
    // 插值（通过缓动函数创建一些列插值点）
    keyFrameAnimation.values = [YXEasing calculateFrameFromPoint:self.showView.center// 起点
                                                         toPoint:CGPointMake(300, 200)//终点
                                                            func:BounceEaseIn// 动画进度
                                                      frameCount:60 * 2];// 帧数
    // 2. 实际目标位置
    self.showView.center = CGPointMake(300, 200);// 真正目标位置

    // 3. 添加动画到视图
    [self.showView.layer addAnimation:keyFrameAnimation forKey:nil];
}

@end
