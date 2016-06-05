//
//  AbstractImplementor.h
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    kUp,
    kDown,
    kLeft,
    kRight,
    kA,
    kB,
    KO,
    KX,
} EcommandType;
@interface AbstractImplementor : NSObject

/**
 *  执行命令
 *
 *  @param command 命令枚举值
 */
- (void)loadCommand:(EcommandType)command;

@end
