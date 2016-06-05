//
//  CircleUIView.m
//  L0804_用CAShapeLayer实现圆形进度条效果
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "CircleUIView.h"

@interface CircleUIView ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation CircleUIView

// 构造器
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1. 贝塞尔曲线
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        
        // 2. CAShapeLayer
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.bounds;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth=  1.f;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        _shapeLayer.strokeEnd = 0.f;// 一开使进度为0
        
        // 3. 关联
        _shapeLayer.path = path.CGPath;
        
        // 4. 添加并显示
        [self.layer addSublayer:_shapeLayer];
    }
    return self;
}

// strokeStart
@synthesize startValue = _startValue;
- (void)setStartValue:(CGFloat)startValue {
    _startValue = startValue;
    _shapeLayer.strokeStart = startValue;
}
- (CGFloat)startValue {
    return _startValue;
}

// strokeEnd
@synthesize value = _value;
- (void)setValue:(CGFloat)value {
    _value = value;
    _shapeLayer.strokeEnd = value;
}
- (CGFloat)value {
    return _value;
}

// lineWidth
@synthesize lineWidth = _lineWidth;
- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    _shapeLayer.lineWidth = lineWidth;
}
- (CGFloat)lineWidth {
    return _lineWidth;
}

// strokeColor
@synthesize lineColor = _lineColor;
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _shapeLayer.strokeColor = lineColor.CGColor;
}
- (UIColor *)lineColor {
    return _lineColor;
}



@end
