//
//  ProgressUIView.h
//  L0901_用CALayer定制下载进度条控件
//
//  Created by baidu on 16/4/13.
//  Copyright © 2016年 tonyearth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressUIView : UIView
@property (nonatomic, assign) CGFloat progress;// 进度参数（0～100）
@property (nonatomic, strong) UIColor *layerColor;// 修改layer的颜色
@end
