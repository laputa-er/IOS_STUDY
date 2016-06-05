//
//  BlurDownloadPicView.h
//  L02设计下载图片后自动模糊的控件
//
//  Created by TonyEarth on 16/4/5.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlurDownloadPicView : UIView

@property (nonatomic, strong) NSString *pictureUrlString;// 图片下载地址
@property (nonatomic) UIViewContentMode contentMode;// 图片显示的方式

// 开始执行
- (void)startProgress;
@end
