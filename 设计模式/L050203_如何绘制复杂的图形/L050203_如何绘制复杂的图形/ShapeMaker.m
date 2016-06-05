//
//  ShapeMaker.m
//  L050203_如何绘制复杂的图形
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ShapeMaker.h"

@implementation ShapeMaker

+ (void)drawCircleWithParas:(NSDictionary *)paras {
    // 绘制一个圆
    Circle *circle = [Circle new];
    circle.radius = 10.f;
    [circle draw];
}

+ (void)drawCircleAndRectangle:(NSDictionary *)paras {
    // 绘制圆
    Circle *circle = [Circle new];
    circle.radius = 10.f;
    [circle draw];
    
    // 绘制一个矩形
    Rectangle *rectangle = [Rectangle new];
    rectangle.width = 10.f;
    rectangle.height = 20.f;
    [rectangle draw];
}
@end
