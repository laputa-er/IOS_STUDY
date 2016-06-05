//
//  NSObject+StoreValue.m
//  L1003_优化本地存储
//
//  Created by TonyEarth on 16/5/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "NSObject+StoreValue.h"
#import "StoreValue.h"

@implementation NSObject (StoreValue)

- (void)storeValueWithKey:(NSString *)key {
    [[StoreValue sharedInstance] storeValue:self withKey:key];
}

+ (id)valueByKey:(NSString *)key {
    return [[StoreValue sharedInstance] valueWithKey:key];
}
@end
