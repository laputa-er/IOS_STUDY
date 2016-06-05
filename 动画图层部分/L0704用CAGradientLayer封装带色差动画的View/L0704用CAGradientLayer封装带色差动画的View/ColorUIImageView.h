//
//  ColorUIImageView.h
//  L0704用CAGradientLayer封装带色差动画的View
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 渐变方向
 */
typedef enum : NSUInteger {
    UP,// 从上至下
    DOWN,// 从下往上
    RIGHT,// 从左到右
    LEFT// 从右往左
} EColorDirection;

@interface ColorUIImageView : UIImageView
@property (nonatomic, assign) EColorDirection direction;// 渐变方向(可以做动画)
@property (nonatomic, strong) UIColor *color;// 颜色(可以做动画)
@property (nonatomic, assign) CGFloat percent;// 百分比(可以做动画)
@end
