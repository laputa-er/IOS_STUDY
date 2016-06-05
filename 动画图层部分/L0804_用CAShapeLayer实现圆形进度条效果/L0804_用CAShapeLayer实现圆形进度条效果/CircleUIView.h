//
//  CircleUIView.h
//  L0804_用CAShapeLayer实现圆形进度条效果
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleUIView : UIView
@property (nonatomic, assign) CGFloat startValue;// 起始值（0～1）
@property (nonatomic, assign) CGFloat lineWidth;// 线宽（>0）
@property (nonatomic, assign) CGFloat value;// 变化的值
@property (nonatomic, strong) UIColor *lineColor;// 线条颜色
@end
