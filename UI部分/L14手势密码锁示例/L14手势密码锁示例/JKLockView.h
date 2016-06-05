//
//  JKLockView.h
//  L14手势密码锁示例
//
//  Created by TonyEarth on 16/3/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKLockView;
@protocol JKLockViewDelegate <NSObject>

@optional
- (void)lockView:(JKLockView *)lockView didFinishPath:(NSString *)path;

@end

@interface JKLockView : UIView

@property (nonatomic, assign)IBOutlet id<JKLockViewDelegate>delegate;

@end
