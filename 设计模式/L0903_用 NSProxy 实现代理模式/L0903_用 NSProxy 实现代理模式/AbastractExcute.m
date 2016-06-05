//
//  AbstractExcute.m
//  L0903_用 NSProxy 实现代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AbastractExcute.h"

@implementation AbastractExcute

+ (instancetype)shareInstance {
    static AbastractExcute *excute = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        excute = [[AbastractExcute alloc] init];
    });
    return excute;
}

// 不能正确调用是执行的方法
- (void)nullExcute:(NSArray *)infos {
    if (infos.count == 3) {
        NSLog(@"%@ 设置了代理，但该代理没有实现 %@ 方法", infos[0], infos[1]);
    }
    else {
        NSLog(@"%@ 没有设置代理，方法 %@ 没有执行", infos[0], infos[1]);
    }
}
@end
