//
//  LineUIView.h
//  L02设计动画函数的注意事项
//
//  Created by TonyEarth on 16/4/3.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineUIView : UIView

@property (nonatomic) CGFloat offSetX;// 对应动画进度的偏移量
// 显示动画
- (void)showWithDuration:(CGFloat)duration animated:(BOOL)animated;

// 隐藏动画
- (void)hideWithDuration:(CGFloat)duration animated:(BOOL)animated;

// 创建view（懒加载方式）
- (void)buildView;

// 动画百分比（动画进行程度）
- (void)percent:(CGFloat)percent;

@end
