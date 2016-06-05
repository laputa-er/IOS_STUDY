//
//  StoreValue.m
//  L1003_优化本地存储
//
//  Created by TonyEarth on 16/5/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "StoreValue.h"
#import "FastCoder.h"

@implementation StoreValue

+ (StoreValue *)sharedInstance {
    static StoreValue *storeValue = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        storeValue = [[StoreValue alloc] init];
    });
    return storeValue;
}

- (void)storeValue:(id)value withKey:(NSString *)key {
    NSParameterAssert(value);
    NSParameterAssert(key);
    
    // 使用 FastCoder 将数据转为 NSData
    NSData *data = [FastCoder dataWithRootObject:value];
    if (data) {
        // 存储到 用户首选项
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
}

- (id)valueWithKey:(NSString *)key {
    NSParameterAssert(key);
    // 从 用户首选项 取出数据
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    // 使用 FastCoder 将数据转换为原始格式
    return [FastCoder objectWithData:data];
}
@end
