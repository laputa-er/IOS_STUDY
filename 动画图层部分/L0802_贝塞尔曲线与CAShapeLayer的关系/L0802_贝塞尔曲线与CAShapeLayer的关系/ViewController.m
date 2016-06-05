//
//  ViewController.m
//  L0802_贝塞尔曲线与CAShapeLayer的关系
//
//  Created by baidu on 16/4/12.
//  Copyright © 2016年 tonyearth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 1. 贝塞尔曲线
    // UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];// 椭圆形
    // UIBezierPath *rect = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 100)];// 矩形
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];// 圆形
    
    
    // 2. CAShapeLayer
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(0, 0, 200, 50);
    shape.position = self.view.center;
    shape.borderWidth = 1.f;// 显示 CAShapeLayer 的边界
    shape.masksToBounds = YES;// 隐藏益处的贝塞尔曲线围住的区域
    shape.fillColor = [UIColor redColor].CGColor;
    
    // 3. 建立关联
    shape.path = circle.CGPath;// 看下圆形的效果
    
    // 4. 添加并显示
    [self.view.layer addSublayer:shape];
}
@end
