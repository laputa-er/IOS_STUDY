//
//  EditViewController.h
//  L12通讯录
//
//  Created by TonyEarth on 16/3/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKContactModel, EditViewController;

@protocol EditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(EditViewController *)editVc didSavaContact: (JKContactModel *)model;

@end

@interface EditViewController : UIViewController

@property (nonatomic, assign) id<EditViewControllerDelegate>delegate;
@property (nonatomic, strong) JKContactModel *contactMode;

@end
