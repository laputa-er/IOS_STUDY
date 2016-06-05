//
//  ProgressUIView.m
//  L0901_用CALayer定制下载进度条控件
//
//  Created by baidu on 16/4/13.
//  Copyright © 2016年 tonyearth. All rights reserved.
//

#import "ProgressUIView.h"
@interface ProgressUIView ()
@property (nonatomic, strong) CALayer *progressLayer;
@property (nonatomic, assign) CGFloat currentViewWidth;
@end

@implementation ProgressUIView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化 CALayer
        self.progressLayer = [CALayer layer];
        // 设置 CALayer
        self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
        self.progressLayer.backgroundColor = [UIColor redColor].CGColor;
        self.currentViewWidth = frame.size.width;// 0
        // 添加并显示
        [self.layer addSublayer:self.progressLayer];
    }
    return self;
}

// progress
@synthesize progress = _progress;
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    if (progress <= 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    }
    else if (progress <= 1) {
        self.progressLayer.frame = CGRectMake(0, 0, progress * self.currentViewWidth, self.frame.size.height);
    }
    else {
        self.progressLayer.frame = CGRectMake(0, 0, self.currentViewWidth, self.frame.size.height);
    }
}

- (CGFloat)progress {
    return _progress;
}

// layerColor
@synthesize layerColor = _layerColor;
- (void)setLayerColor:(UIColor *)layerColor
{
    _layerColor = layerColor;
    self.progressLayer.backgroundColor = layerColor.CGColor;
}

- (UIColor *)layerColor {
    return _layerColor;
}

@end
