//
//  LineUIView.m
//  L02设计动画函数的注意事项
//
//  Created by TonyEarth on 16/4/3.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "LineUIView.h"

@interface LineUIView ()
@property (nonatomic) CGRect startRect;// 开始区域
@property (nonatomic) CGRect midRect;// 动画进行到中间时的区域
@property (nonatomic) CGRect endRect;// 结束区域
@end

@implementation LineUIView
// 构造函数
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alpha = 0.f;// 视图创建时是不可见的
    }
    return self;
}

/**
 *  显示视图
 *  预留了非动画情形
 *
 *  @param duration 持续时长
 *  @param animated 是否展现动画
 */
- (void)showWithDuration:(CGFloat)duration animated:(BOOL)animated
{
    if (animated == YES) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = self.midRect;
            self.alpha = 1.f;
        }];
    }
    else {
        self.frame = self.midRect;
        self.alpha = 1.f;
    }
}

/**
 *  隐藏视图
 *  预留了非动画情形
 *
 *  @param duration 持续时长
 *  @param animated 是否展现动画
 */
- (void)hideWithDuration:(CGFloat)duration animated:(BOOL)animated
{
    if (animated == YES) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = self.endRect;
            self.alpha = 0.f;
        } completion:^(BOOL finished){
            // 视图隐藏后将视图复原到初始位置
            self.frame = self.startRect;
            self.alpha = 0.f;
        }];
    }
    else {
        self.frame = self.startRect;
        self.alpha = 0.f;
    }
}

/**
 *  创建view（懒加载方式）
 */
- (void)buildView
{
    self.startRect = self.frame;
    self.midRect = CGRectMake(self.startRect.origin.x + self.offSetX,
                              self.startRect.origin.y,
                              self.startRect.size.width,
                              self.startRect.size.height);
    self.endRect = CGRectMake(self.startRect.origin.x + self.offSetX * 2,
                              self.startRect.origin.y,
                              self.startRect.size.width,
                              self.startRect.size.height);
}

/**
 *  动画百分比（动画进行程度）
 *
 *  @param percent 动画进度
 */
- (void)percent:(CGFloat)percent
{
    CGFloat tmpOffsetX = 0;
    if (percent <= 0) {
        tmpOffsetX = 0;
    }
    else if (percent >= 1) {
        tmpOffsetX = self.offSetX;
    }
    else {
        tmpOffsetX = percent * self.offSetX;
    }
    self.frame = CGRectMake(self.startRect.origin.x + tmpOffsetX,
                            self.startRect.origin.y,
                            self.startRect.size.width,
                            self.startRect.size.height);
}

@end
