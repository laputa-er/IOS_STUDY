//
//  SubscriptionServiceCenter.m
//  L0402_通知中心的抽象设计
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "SubscriptionServiceCenter.h"
// 存储订阅号的字典
static NSMutableDictionary *_subscriptionDictionary = nil;

@implementation SubscriptionServiceCenter

// 初始化存储订阅号的字典
+ (void)initialize {
    if (self == [SubscriptionServiceCenter class]) {
        _subscriptionDictionary = [NSMutableDictionary dictionary];
    }
}

// 获取具体的订阅号
+ (NSHashTable *)existSubscriptionNumber:(NSString *)subscriptionNumber {
    return [_subscriptionDictionary objectForKey:subscriptionNumber];
}

+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);// 确保订阅号不为nil
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [_subscriptionDictionary setObject:hashTable forKey:subscriptionNumber];
    }
}

+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);// 确保订阅号不为nil
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable) {
        [_subscriptionDictionary removeObjectForKey:subscriptionNumber];
    }
}

+ (void)addCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable addObject:customer];
}

+ (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable removeObject:customer];
}

+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);// 确保订阅号不为nil
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];// 存储订阅号的字典
    if (hashTable) {
        // 遍历订阅号
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        id <SubscriptionServiceCenterProtocol>object = nil;
        while (object = [enumerator nextObject]) {
            // 向每个订阅用户发送订阅订阅内容
            if ([object respondsToSelector:@selector(subscriptionMessage:subscriptionNumber:)]) {
                [object subscriptionMessage:message subscriptionNumber:subscriptionNumber];
            }
        }
    }
}

@end
