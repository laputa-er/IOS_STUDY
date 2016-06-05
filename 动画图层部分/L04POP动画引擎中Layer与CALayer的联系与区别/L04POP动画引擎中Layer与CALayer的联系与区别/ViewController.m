//
//  ViewController.m
//  L04POP动画引擎中Layer与CALayer的联系与区别
//
//  Created by baidu on 16/4/7.
//  Copyright © 2016年 tonyearth. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>

@interface ViewController ()
@property (nonatomic, strong) CALayer *normalCALayer;
@property (nonatomic, strong) CALayer *popCALayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 处理 normalCALayer
    [self accessNormalCALayer];
}

#pragma mark - pop CALayer 动画
/**
 *  pop CALyer 动画
 */
- (void)accessPOPCALayer{
    // 初始化 layer
    self.normalCALayer = [CALayer layer];
    self.normalCALayer.frame = CGRectMake(100, 100, 100, 100);
    self.normalCALayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.popCALayer];
    
    // 初始化 POP 动画
    POPBasicAnimation *popAnimation = \
        [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    popAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100 + 50, 400)];// pop 动画不需要 fromValue
    popAnimation.duration = 4.f;
    popAnimation.timingFunction = \
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    // 添加动画
    [self.popCALayer pop_addAnimation:popAnimation forKey:nil];
    
    // 1.5s后移除动画：在哪儿移除就停在哪儿
    [self performSelector:@selector(removePopAnimation) withObject:nil afterDelay:1.5];
}

- (void)removePopAnimation
{
    [self.popCALayer pop_removeAllAnimations];// 移除所有 pop 动画
}

#pragma mark - CALayer 动画
/**
 *  CALyer 动画
 */
- (void)accessNormalCALayer{
    // 初始化 layer
    self.normalCALayer = [CALayer layer];
    self.normalCALayer.frame = CGRectMake(100, 100, 100, 100);
    self.normalCALayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.normalCALayer];
    
    // 初始化动画
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    baseAnimation.fromValue = [NSValue valueWithCGPoint:self.normalCALayer.position];
    baseAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100 + 50, 400)];
    baseAnimation.timingFunction = \
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    // 设置结束位置的值
    self.normalCALayer.position = CGPointMake(100 + 50, 400);
    // 开始动画
    [self.normalCALayer addAnimation:baseAnimation forKey:nil];
    
    // 1.5s后移除动画：无论在哪儿停止，都会出现在最后设置的位置（非常突兀）
    [self performSelector:@selector(removeNormalAnimation) withObject:nil afterDelay:1.5];
}

/**
 *  移除动画
 */
- (void)removeNormalAnimation
{
    CALayer *layer = self.normalCALayer.presentationLayer;
    NSLog(@"%@", NSStringFromCGRect(layer.frame));
    NSLog(@"%@", NSStringFromCGRect(self.normalCALayer.frame));

    [self.normalCALayer removeAllAnimations];// 移除掉所有动画
}

@end
