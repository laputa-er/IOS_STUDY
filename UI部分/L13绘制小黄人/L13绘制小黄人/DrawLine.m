//
//  DrawLine.m
//  L13绘制小黄人
//
//  Created by TonyEarth on 16/3/23.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine


/**
 *  @override
 *  系统自动调用，视图显示在屏幕上的时候调用切只调用一次
 */
- (void)drawRect:(CGRect)rect {
    drwaLine();
    drawRect();
    drawTriangle();
}

/**
 *  绘制直线
 *  绘制两条样式不同的线，因此在两个图形上下文中分别绘制
 */
void drwaLine() {
    // 第1条线
    // 1. 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 将上下文复制一份到栈中(作为为第二条线的图形上下文)
    CGContextSaveGState(context);
    
    // 2. 绘制图形
    CGContextSetLineWidth(context, 20);// 设置线的宽度
    CGContextSetLineCap(context, kCGLineCapRound);// 设置线条头尾部的样式
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);// 设置颜色
    
    CGContextMoveToPoint(context, 10, 10);//设置起点
    CGContextAddLineToPoint(context, 100, 100);
    // 3. 显示到View
    CGContextStrokePath(context);// 以空心的方式画出
    
    // 第二条线
    // 1. 获取图形上下文
    CGContextRestoreGState(context);// 将图形上下文出栈， 替换当前的上下文
    // 2. 绘制图形
    CGContextSetLineJoin(context, kCGLineJoinRound);// 设置线断转折点的样式
    
    CGContextAddLineToPoint(context, 150, 120);
    CGContextAddLineToPoint(context, 150, 180);
    // 3. 显示到View
    CGContextStrokePath(context);// 以空心的方式画出
}

/**
 *  绘制四边形
 */
void drawRect() {
    // 1. 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 绘制四边形
    CGContextAddRect(context, CGRectMake(10, 10, 120, 180));// 四边形
    [[UIColor purpleColor] setFill];// 设置填充色
    // 3. 显示在 View 上
    CGContextFillPath(context);
}

/**
 *  绘制三角形
 */
void drawTriangle() {
    // 1. 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 绘制三角形
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);// 第一个边
    CGContextAddLineToPoint(context, 150, 100);// 第二个边
    CGContextClosePath(context);// 第三个边（闭合路径，连接起点和最后一个点）
    [[UIColor redColor] set];
    // 3. 显示在view
    CGContextStrokePath(context);
}
@end
