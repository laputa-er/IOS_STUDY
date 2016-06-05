//
//  LighterCommand.h
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"

@interface LighterCommand : NSObject <CommandProtocol>

/**
 *  与接收器绑定并设置参数
 *
 *  @param receiver  接收器
 *  @param parameter 参数
 *
 */
- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter;
@end
