//
//  LineUIView.m
//  L01动画中的高內聚低耦合
//
//  Created by TonyEarth on 16/4/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "LineUIView.h"

@interface LineUIView ()
@property (nonatomic) CGRect rect;// 视图区域
@end

@implementation LineUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.rect = frame;
    }
    return self;
}

// 出现的动画效果
- (void)show
{
    // 动画的目标区域
    CGRect newRect = CGRectMake(self.rect.origin.x + self.offsetX,
                                self.rect.origin.y,
                                self.rect.size.width,
                                self.rect.size.height);
    // 延迟2秒执行持续时间为1秒的动画
    [UIView animateWithDuration:1 animations:^{
        self.frame = newRect;
    }];
}

// 消失的动画效果
- (void)hide
{
    CGRect newRect = CGRectMake(self.rect.origin.x + self.offsetX + self.offsetX,
                                self.rect.origin.y,
                                self.rect.size.width,
                                self.rect.size.height);
    [UIView animateWithDuration:1 animations:^{
        self.frame = newRect;
        self.alpha = 0.f;
    }];
}
@end
