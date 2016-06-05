//
//  Invoker.h
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"

@interface Invoker : NSObject

/**
 *  做成单例的
 *
 *  @return 单例实例
 */
+ (instancetype)shareInstance;

/**
 *  回退操作
 */
- (void)rollBack;

/**
 *  添加指令操作
 *
 *  @param command 指令
 */
- (void)addAndExcute:(id <CommandProtocol>)command;

@end
