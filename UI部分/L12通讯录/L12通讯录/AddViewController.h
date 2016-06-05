//
//  AddViewController.h
//  L12通讯录
//
//  Created by TonyEarth on 16/3/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddViewController, JKContactModel;

// 定义处理添加工作的代理协议
@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addContact:(AddViewController *)addVc didAddContact:(JKContactModel *)contact;

@end

@interface AddViewController : UIViewController

@property (nonatomic, assign)id<AddViewControllerDelegate> delegate;// 代理对象

@end
