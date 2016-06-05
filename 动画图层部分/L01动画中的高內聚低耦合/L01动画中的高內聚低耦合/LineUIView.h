//
//  LineUIView.h
//  L01动画中的高內聚低耦合
//
//  Created by TonyEarth on 16/4/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineUIView : UIView
@property (nonatomic) CGFloat offsetX;// 水平方向偏移量

- (void)show;

- (void)hide;
@end
