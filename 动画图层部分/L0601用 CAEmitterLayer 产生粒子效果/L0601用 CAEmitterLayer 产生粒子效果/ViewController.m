//
//  ViewController.m
//  L0601用 CAEmitterLayer 产生粒子效果
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. CAEmitterLayer
    // 创建出粒子发射图层
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.borderWidth = 2.f;// 边框宽度（显示边框）
    emitterLayer.frame = CGRectMake(100, 100, 200, 300);// 设置尺寸
    emitterLayer.masksToBounds = YES;// 隐藏溢出的粒子
    emitterLayer.emitterPosition = CGPointMake(50, 50);// 发射点
    emitterLayer.emitterMode = kCAEmitterLayerSurface;// 发射模式
    emitterLayer.emitterShape = kCAEmitterLayerLine;// 发射形状
    
    // 添加图层到当前视图图层
    [self.view.layer addSublayer:emitterLayer];
    
    // 2. CAEmitterCell（粒子）
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.birthRate = 10.f;// 粒子产生率
    cell.lifetime = 120.f;// 粒子声明周期
    cell.velocity = 30;// 加速度
    cell.velocityRange = 10.f;// 加速度微调
    cell.yAcceleration = 2.f;// y 轴加速度
    cell.emissionRange = 0.5 * M_1_PI;// 发射角度
    cell.color = [UIColor blackColor].CGColor;// 设置粒子颜色
    cell.contents = (__bridge id)([UIImage imageNamed:@"snow"].CGImage);// 设置图片
    
    // 3. 将 CAEmitterCell(粒子)关联到CAEmitterLayer
    emitterLayer.emitterCells = @[cell];
}

@end
