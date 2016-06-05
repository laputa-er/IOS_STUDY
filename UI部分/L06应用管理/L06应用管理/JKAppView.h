//
//  JKAppView.h
//  L06应用管理
//
//  Created by TonyEarth on 16/3/1.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKAppInfo;
//-------协议
@protocol JKAppViewDelegate <NSObject>

@optional
// 下载按钮被点击的响应函数
- (void)downloadClickWithBtn:(UIButton *)btn;

@end

//-------接口
@interface JKAppView : UIView

// 属性：一项app信息
@property (nonatomic, strong) JKAppInfo *appInfo;
// 属性：代理对象
@property (nonatomic, weak) id<JKAppViewDelegate> delegate;// 要求代理对象采纳JKAppViewDelegate协议
// 构造器
+ (instancetype)appView;

@end
