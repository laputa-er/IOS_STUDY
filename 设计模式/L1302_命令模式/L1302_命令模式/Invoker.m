//
//  Invoker.m
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Invoker.h"

@interface Invoker ()
/**
 *  命令队列
 */
@property (nonatomic, strong)NSMutableArray *queue;
@end

@implementation Invoker

+ (instancetype)shareInstance {
    static Invoker *shareInstanceValue = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        shareInstanceValue = [[Invoker alloc] init];
        shareInstanceValue.queue = [NSMutableArray array];
    });
    return shareInstanceValue;
}

- (void)rollBack {
    id <CommandProtocol> command = self.queue.lastObject;
    [command rollBackExcute];
    [self.queue removeLastObject];
}

- (void)addAndExcute:(id<CommandProtocol>)command {
    NSParameterAssert(command);
    [self.queue addObject:command];
    [command excute];
}

@end

