//
//  ViewController.m
//  L0503用缓动函数模拟弹簧效果
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "YXEasing.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *secLayer;// 秒针
@property (nonatomic, strong) NSTimer *timer;// 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个表盘 UIView
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    showView.center = self.view.center;
    showView.layer.borderWidth = 1.f;
    showView.layer.cornerRadius = 150;
    showView.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:showView];
    
    // 创建出秒针 CALayer
    self.secLayer = [CALayer layer];
    self.secLayer.anchorPoint = CGPointMake(0, 0);
    self.secLayer.frame = CGRectMake(150, 150, 1, 150);
    self.secLayer.backgroundColor = [UIColor blackColor].CGColor;
    [showView.layer addSublayer:self.secLayer];
    
    // 创建定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f// 1秒钟调用一次
                                                  target:self// 目标控制器
                                                selector:@selector(timerEvent) // 目标方法
                                                userInfo:nil
                                                 repeats:YES];
}

/**
 *  指针变化动画
 */
- (void)timerEvent
{
    static int i = 1;// 时间点
    CGFloat oldValue = DEGREES_TO_RADIANS((360 / 60.f) * i++);// 旧弧度
    CGFloat newValue = DEGREES_TO_RADIANS((360 / 60.f) * i);// 新弧度
    
    // 创建关键帧动画
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"transform.rotation.z";
    keyFrameAnimation.duration = 0.5;
    keyFrameAnimation.values = [YXEasing calculateFrameFromValue:oldValue// 起始弧度
                                                         toValue:newValue// 结束弧度
                                                            func:ElasticEaseOut // 动画效果
                                                      frameCount:0.5 * 30];// 帧数
    self.secLayer.transform = CATransform3DMakeRotation(newValue,
                                                        0,
                                                        0,
                                                        1);
    [self.secLayer addAnimation:keyFrameAnimation forKey:nil];
}
@end
