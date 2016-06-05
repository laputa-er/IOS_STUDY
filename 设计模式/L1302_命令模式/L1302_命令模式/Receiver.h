//
//  Receiver.h
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Receiver : NSObject {
    CGFloat _hud;// 色彩
    CGFloat _saturation;// 饱和度
    CGFloat _brightness;// 亮度
    CGFloat _alpha;// 透明度
}

/**
 *  被服务的对象（遥控器）
 */
@property (nonatomic, weak) UIView *clientView;

/**
 *  调暗
 *
 *  @param paramater 操作系数
 */
- (void)makeDarker:(CGFloat)parameter;

/**
 *  调亮
 *
 *  @param parameter 操作系数
 */
- (void)makeLighter:(CGFloat)parameter;

@end
