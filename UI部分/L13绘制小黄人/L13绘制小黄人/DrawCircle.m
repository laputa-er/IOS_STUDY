//
//  DrawCircle.m
//  L13绘制小黄人
//
//  Created by TonyEarth on 16/3/24.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "DrawCircle.h"

/**
 *  角度转换为弧度
 *
 *  @param angle 角度
 *
 *  @return 弧度
 */
CGFloat arc(CGFloat angle) {
    return angle * (M_PI / 180);
}

@implementation DrawCircle

- (void)drawRect:(CGRect)rect {
    drawArc();
    drawCircle();
    drawImg();
    drawText();
    drawBezier();
}

/**
 *  画圆
 */
void drawCircle() {
    // 1. 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 绘制图形
    CGContextAddEllipseInRect(context, CGRectMake(50, 50, 130, 100));
    CGContextSetLineWidth(context, 10);
    // 3. 显示在View
    CGContextStrokePath(context);
}

/**
 *  弧形
 */
void drawArc() {
    // 1. 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 绘制图形
    // 参数：上下文, 圆心横坐标，圆心纵坐标，半径，开始的角度，结束的角度，0顺时针/1逆时针
    CGContextAddArc(context, 100, 100, 50, arc(90), arc(200), 1);
    // 3. 显示在View上
    CGContextFillPath(context);
}

/**
 *   绘制字体
 */
void drawText() {
    NSString *str = @"极客学院";// 字串
    // 设置（字体样式信息保存在字典中）
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];// 字体大小
    attributes[NSForegroundColorAttributeName] = [UIColor purpleColor];// 字体颜色
    // 绘制
    [str drawInRect:CGRectMake(100, 100, 100, 30) withAttributes:attributes];
}

/**
 *  绘制图片
 */
void drawImg(){
    // 1. 取得图片
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    // 2. 画
    // img drawAtPoint
    // img drawInRect
    [img drawAsPatternInRect:CGRectMake(0, 0, 300, 300)];
    NSString *str = @"极客学院";
    // 3. 显示到View
    [str drawInRect:CGRectMake(0, 0, 100, 30) withAttributes:nil];
}

/**
 *  贝塞尔曲线
 */
void drawBezier(){
    // 1.取得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 起点
    CGContextMoveToPoint(context, 10, 10);
    
    //CGContextAddCurveToPoint(context, 120, 100, 180, 50, 190, 190);// 2个控制点
    CGContextAddQuadCurveToPoint(context, 150, 200, 200, 100);// 1个控制点
    // 绘制
    CGContextStrokePath(context);
}

@end
