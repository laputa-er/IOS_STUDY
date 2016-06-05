//
//  NSObject+MementoCenter.m
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "NSObject+MementoCenter.h"
#import "MementoCenter.h"

@implementation NSObject (MementoCenter)

- (void)saveStateWithKey:(NSString *)key {
    NSParameterAssert(key);
    // 要求当前对象必需采纳了 MementoCenterProtocol 协议
    id <MementoCenterProtocol> obj = (id <MementoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(currentState)]) {
        // 调用 MementoCenter 完成对象状态的存储
        [MementoCenter saveMementoObject:obj withKey:key];
    }
}

- (void)recoverFromStateWithKey:(NSString *)key {
    NSParameterAssert(key);
    id state = [MementoCenter mementoObjectWithKey:key];// 从数据中心获取目标状态
    id <MementoCenterProtocol> obj = (id <MementoCenterProtocol>) self;// 获取当前对象
    if ([obj respondsToSelector:@selector(recoverFromStateWithKey:)]) {
        [obj recoverFromState:state];// 恢复对象状态
    }
}

@end
