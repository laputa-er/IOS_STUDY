//
//  ViewController.m
//  l0803_StrokeStart与StrokeEnd动画
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;// 定时器
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 1. 背景设置
    self.view.backgroundColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1];
    
    // 2. 贝塞尔曲线
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    // 3. CAShapeLayer
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 0, 100, 100);
    _shapeLayer.position = self.view.center;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    _shapeLayer.lineWidth = 2.f;
    _shapeLayer.strokeStart = 0.f;
    _shapeLayer.strokeEnd = 0.f;
    
    // 4. 建立贝塞尔曲线与CAShapeLayer之间的关联
    _shapeLayer.path = oval.CGPath;

    // 5. 添加并显示
    [self.view.layer addSublayer:_shapeLayer];
    
    // 6. 定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                              target:self
                                            selector:@selector(animationEventTypeTwo)
                                            userInfo:nil
                                             repeats:YES];
}

/**
 *  只改变 strokeEnd
 */
- (void)animationEventTypeOne
{
    _shapeLayer.strokeEnd = arc4random() % 100 / 100;
}

/**
 *  同时改变 strokeStart 和 strokeEnd
 */
- (void)animationEventTypeTwo
{
    CGFloat valueOne = arc4random() % 100 / 100.f;
    CGFloat valueTwo = arc4random() % 100 / 100.f;
    
    _shapeLayer.strokeStart = valueOne < valueTwo ? valueOne : valueTwo;// 取小的
    _shapeLayer.strokeEnd = valueOne > valueTwo ? valueOne : valueTwo;// 取大的
}
@end
