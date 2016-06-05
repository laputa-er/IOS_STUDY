//
//  MementoCenter.m
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "MementoCenter.h"
#import "FastCoder.h"

@implementation MementoCenter

+ (void)saveMementoObject:(id<MementoCenterProtocol>)object withKey:(NSString *)key {
    NSParameterAssert(object);
    NSParameterAssert(key);
    
    // 获取对象当前的状态
    id data = [object currentState];
    
    // 将状态数据转化为 NSData
    NSData *tmpData = [FastCoder dataWithRootObject:data];
    
    // 存储到 首选项
    if (tmpData) {
        
        [[NSUserDefaults standardUserDefaults] setObject:tmpData
                                                  forKey:key];
    }
}

+ (id)mementoObjectWithKey:(NSString *)key {
    NSParameterAssert(key);
    
    id data = nil;
    // 从 首选项 取出数据
    NSData *tmpData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (tmpData) {
        // 解码数据
        data = [FastCoder objectWithData:tmpData];
    }
    return data;
}
@end
