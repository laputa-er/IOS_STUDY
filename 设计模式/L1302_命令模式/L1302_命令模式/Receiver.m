//
//  Receiver.m
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Receiver.h"

@implementation Receiver

/**
 *  重写 clientView set
 *
 *  @param clientView 遥控器
 */
- (void)setClientView:(UIView *)clientView {
    _clientView = clientView;
    // 获取客户端视图的背景色
    UIColor *color = _clientView.backgroundColor;
    // 获取背景色的各项参数来初始化 Receiver 的一些私有属性
    [color getHue:&_hud
       saturation:&_saturation
       brightness:&_brightness
            alpha:&_alpha];
}

- (void)makeDarker:(CGFloat)parameter {
    // 降低亮度
    _brightness -= parameter;
    // 限制亮度最小为0
    _brightness = MAX(0, _brightness);
    
    // 更新背景色
    _clientView.backgroundColor = [UIColor colorWithHue:_hud
                                             saturation:_saturation
                                             brightness:_brightness
                                                  alpha:_alpha];
}

- (void)makeLighter:(CGFloat)parameter {
    _brightness += parameter;
    // 限制亮度最大为1
    _brightness = MIN(1, _brightness);
    
    _clientView.backgroundColor = [UIColor colorWithHue:_hud
                                             saturation:_saturation
                                             brightness:_brightness
                                                  alpha:_alpha];
}
@end
