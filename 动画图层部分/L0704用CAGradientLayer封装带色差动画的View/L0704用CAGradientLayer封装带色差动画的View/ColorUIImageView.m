//
//  ColorUIImageView.m
//  L0704用CAGradientLayer封装带色差动画的View
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ColorUIImageView.h"

@interface ColorUIImageView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;// 渐变图层

@end
@implementation ColorUIImageView

// 构造函数
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化 CAGradientLayer 实例
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.bounds;
        self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                      (__bridge id)[UIColor redColor].CGColor];
        self.gradientLayer.locations = @[@(1), @(1)];
        [self.layer addSublayer:self.gradientLayer];
    }
    return self;
}

// 颜色组 color
@synthesize color = _color;
- (void)setColor:(UIColor *)color
{
    _color = color;
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)color.CGColor];
}
- (UIColor *)color
{
    return _color;
}
// 渐变方向 direction

@synthesize direction = _direction;
- (void)setDirection:(EColorDirection)direction
{
    _direction = direction;
    if (direction == UP) {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint   = CGPointMake(0, 1);
    } else if (direction == DOWN) {
        self.gradientLayer.startPoint = CGPointMake(0, 1);
        self.gradientLayer.endPoint   = CGPointMake(0, 0);
    } else if (direction == RIGHT) {
        self.gradientLayer.startPoint = CGPointMake(1, 0);
        self.gradientLayer.endPoint   = CGPointMake(0, 0);
    } else if (direction == LEFT) {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint   = CGPointMake(1, 0);
    } else {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint   = CGPointMake(0, 1);
    }
}
- (EColorDirection)direction
{
    return _direction;
}
// 分割点 percent
@synthesize percent = _percent;
- (void)setPercent:(CGFloat)percent {
    _percent = percent;
    self.gradientLayer.locations = @[@(percent), @(1)];
}
- (CGFloat)percent
{
    return _percent;
}
@end
