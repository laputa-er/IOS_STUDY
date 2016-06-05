//
//  FadeStringUIView.h
//  L03设计文本横向渐变消失的控件
//
//  Created by TonyEarth on 16/4/6.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FadeStringUIView : UIView

/**
 *  显示的文本
 */
@property (nonatomic, strong) NSString *text;

/**
 *  从左到右渐变消失
 *
 *  @param duration 动画持续时间
 *  @param animated 是否显示动画
 */
- (void)fadeRightWithDuration:(CGFloat)duration animated:(BOOL)animated;
@end
