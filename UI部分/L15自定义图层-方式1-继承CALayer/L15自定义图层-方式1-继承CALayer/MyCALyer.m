//
//  MyCALyer.m
//  L15自定义图层-方式1-继承CALayer
//
//  Created by TonyEarth on 16/3/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "MyCALyer.h"

@implementation MyCALyer
/**
 *  @override
 *  该方法中完成对图层的绘制
 *
 *  @param ctx 图形上下文
 */
-(void)drawInContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);// 设置颜色
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 100, 100));// 椭圆
    CGContextFillPath(ctx);// 实心绘制
}
@end
