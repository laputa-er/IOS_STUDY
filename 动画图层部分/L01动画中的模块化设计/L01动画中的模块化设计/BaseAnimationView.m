//
//  BaseAnimationView.m
//  L01动画中的模块化设计
//
//  Created by TonyEarth on 16/4/4.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BaseAnimationView.h"
#import "CircleUIView.h"
#import "LineUIView.h"
#import "RectUIView.h"

@interface BaseAnimationView ()

@property (nonatomic, strong) CircleUIView *circleView;
@property (nonatomic, strong) LineUIView *lineView;

@end

@implementation BaseAnimationView

- (void)show {
    [self.circleView show];
    [self.lineView show];
}
- (void)hide {
    [self.circleView hide];
    [self.lineView hide];
}
- (void)buildView {
    self.circleView = [[CircleUIView alloc] initWithFrame:CGRectZero];
    [self addSubview: self.circleView];
    
    self.lineView = [[LineUIView alloc] initWithFrame:CGRectZero];
    [self addSubview: self.lineView];
}

@end
