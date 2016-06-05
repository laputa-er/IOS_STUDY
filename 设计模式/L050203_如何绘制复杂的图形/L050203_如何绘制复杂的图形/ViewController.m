//
//  ViewController.m
//  L050203_如何绘制复杂的图形
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Circle.h"
#import "Rectangle.h"
#import "ShapeMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 绘制一个圆的操作
    [ShapeMaker drawCircleWithParas:@{@"a" : @"b"}];
    
    // 绘制圆 + 矩形
    [ShapeMaker drawCircleAndRectangle:@{@"a" : @"b", @"c" : @"d"}];
}

@end
