//
//  DrawHuman.m
//  L13小黄人
//
//  Created by TonyEarth on 16/3/24.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "DrawHuman.h"
#define JKRadius 70// 半径
#define JKTopY 100// 即是身体高度，也是身体顶部纵坐标
#define JKColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue :(b)/255.0 alpha:1.0]// 身体颜色
@implementation DrawHuman

- (void)drawRect:(CGRect)rect {
    // 1. 图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    drawBody(context, rect);
    drawMouse(context, rect);
    drawEyes(context, rect);
}

/**
 *  身体
 */
void drawBody(CGContextRef context, CGRect rect) {
    // 上半圆
    CGFloat topX = rect.size.width * 0.5;// 圆心横坐标
    CGFloat topY = JKTopY;// 圆心纵坐标
    CGFloat topRadius = JKRadius;// 圆形半径
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);// 绘制半圆（从右侧沿逆时针向左绘制）
    
    // 身体左侧竖线
    CGFloat middleX = topX - topRadius;// 终点横坐标
    CGFloat middleH = JKTopY;// 身体部分高度
    CGFloat middleY =  topY + middleH;// 终点纵坐标
    CGContextAddLineToPoint(context, middleX, middleY);
    
    // 下半圆
    CGFloat bottomX = topX;// 圆心横坐标
    CGFloat bottomY = middleY;// 圆心纵坐标
    CGFloat bottomRedius = topRadius;// 半径
    CGContextAddArc(context, bottomX, bottomY, bottomRedius, M_PI, 0, 1);
    
    // 闭合
    CGContextClosePath(context);
    
    // 设置颜色
    [JKColor(252, 218, 0) set];
    
    // 显示
    CGContextFillPath(context);
}

/**
 *  嘴
 *  采用赛贝尔曲线，1个控制点
 */
void drawMouse(CGContextRef context, CGRect rect) {
    // 控制点
    CGFloat controlX = rect.size.width * 0.5;
    CGFloat controlY = rect.size.height * 0.3;
    
    // 移动到起点
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(context, currentX, currentY);
    
    // 结束点坐标
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    
    // 绘制
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    
    // 设置颜色
    [[UIColor blackColor] set];

    // 显示到View
    CGContextStrokePath(context);
}

/**
 *  眼睛
 */
void drawEyes(CGContextRef context, CGRect rect) {
    //黑色绑带（一条很粗的线）
    CGFloat startX = rect.size.width * 0.5 - JKRadius;// 起点横坐标
    CGFloat startY = JKTopY;// 起点纵坐标
    CGContextMoveToPoint(context, startX, startY);
    CGFloat endX = startX + 2 * JKRadius;// 终点横坐标
    CGFloat endY = startY;// 终点纵坐标
    CGContextAddLineToPoint(context, endX, endY);// 划线
    CGContextSetLineWidth(context, 15);// 设置线的宽度
    [[UIColor blackColor] set];// 设置线的颜色
    CGContextStrokePath(context);// 显示

    //灰色镜框
    [JKColor(61, 62, 66) set];
    CGFloat kuangRadius = JKRadius * 0.4;
    CGFloat kuangY = startY;
    CGFloat kuangX = rect.size.width * 0.5 - kuangRadius;
    CGContextAddArc(context, kuangX + 25, kuangY, kuangRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    
    //里面的白色框
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = kuangRadius * 0.7;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(context, whiteX + 25, whiteY, whiteRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    
    //眼睛
    [[UIColor blackColor] set];
    CGFloat blackRadius = whiteRadius * 0.5;
    CGFloat blackX = whiteX;
    CGFloat blackY = whiteY;
    CGContextAddArc(context, blackX + 25, blackY, blackRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
}
@end
