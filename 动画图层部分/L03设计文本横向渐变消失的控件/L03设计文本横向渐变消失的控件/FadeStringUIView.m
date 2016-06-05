//
//  FadeStringUIView.m
//  L03设计文本横向渐变消失的控件
//
//  Created by TonyEarth on 16/4/6.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "FadeStringUIView.h"

@interface FadeStringUIView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *mask;
@end

@implementation FadeStringUIView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 创建文本
        [self createLabel:self.bounds];
        // 创建mask
        [self createMask:self.bounds];
    }
    return  self;
}

- (void)fadeRightWithDuration:(CGFloat)duration animated:(BOOL)animated
{
    CGRect frame = self.mask.frame;
    frame.origin.x += frame.size.width;
    if (animated) {

        [UIView animateWithDuration:3.f animations:^{
            self.mask.frame = frame;
        }];
    }
    else {
        self.mask.frame = frame;
    }

}

- (void)createLabel:(CGRect)frame {
    self.label = [[UILabel alloc] initWithFrame:frame];
    self.label.font = [UIFont systemFontOfSize:20.f];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    [self addSubview:self.label];
}

- (void)createMask:(CGRect)frame {
    // 创建出渐变的layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations = @[@(0.01), @(0.1), @(0.9), @(0.99)];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    self.mask = [[UIView alloc] initWithFrame:frame];
    [self.mask.layer addSublayer:gradientLayer];
    self.maskView = self.mask;
}

#pragma mark - 重写 text 的set和get， 该值被修改时同时更新到 label
@synthesize text = _text;
- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
}
- (NSString *)text {
    return _text;
}
@end
