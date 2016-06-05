//
//  RootViewController.h
//  L11三级控制器
//  描述：顶层控制器（标签控制器）
//
//  Created by TonyEarth on 16/3/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITabBarController

@property (nonatomic, strong) UIView *tabBarView;// 标签工具栏

// 显示或隐藏标签工具栏
- (void)showTabBar:(BOOL)show;

@end
