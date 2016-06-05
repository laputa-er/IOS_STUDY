//
//  ShapeMaker.h
//  L050203_如何绘制复杂的图形
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"

@interface ShapeMaker : NSObject

+ (void)drawCircleWithParas:(NSDictionary *)paras;

+ (void)drawCircleAndRectangle:(NSDictionary *)paras;

@end
