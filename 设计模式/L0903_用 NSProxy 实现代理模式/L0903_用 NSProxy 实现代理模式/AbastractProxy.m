//
//  AbastractProxy.m
//  L0903_用 NSProxy 实现代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AbastractProxy.h"
#import "AbastractExcute.h"
#import <objc/runtime.h>

@implementation AbastractProxy

/**
 *  @override
 *  验证方法签名
 *
 *  @param sel 选择器
 *
 *  @return 方法签名
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    // 如果代理对象（这里指的是ViewController实例）实现了相应的方法
    // 就返回实现方法的方法签名
    if ([self.delegate respondsToSelector:sel]) {
        return [self.delegate methodSignatureForSelector:sel];
    }
    // 否则，就用 AbastractExcute 实例的方法签名替代之
    else {
        AbastractExcute *excute = [AbastractExcute shareInstance];
        return [excute methodSignatureForSelector:NSSelectorFromString(@"nullExcute:")];
    }
}

/**
 *  向代理对象派发消息
 *
 *  @param invocation 代理对象
 */
- (void)forwardInvocation:(NSInvocation *)invocation {
    // 获取选择器
    SEL selector = [invocation selector];
    // 如果代理对象（这里指的是ViewController实例）实现了相应的方法
    // 就执行这个方法
    if ([self.delegate respondsToSelector:selector]) {
        [invocation setTarget:self.delegate];
        [invocation invoke];
    }
    // 否则
    else {
        NSString *selectorString = NSStringFromSelector(invocation.selector);
        invocation.selector = NSSelectorFromString(@"nullExcute:");
        AbastractExcute *excute = [AbastractExcute shareInstance];
        [invocation setTarget:excute];
        
        const char *className = class_getName([self class]);
        NSArray *infos = nil;
        // 没有设置代理对象
        if (self.delegate) {
            infos = @[[NSString stringWithUTF8String:className], selectorString, @""];
        }
        // 设置了代理对象，但代理对象没有事项相应的方法
        else {
            infos = @[[NSString stringWithUTF8String:className], selectorString];
        }
        [invocation setArgument:&infos atIndex:2];
        [invocation invoke];
    }
}

@end
