//
//  StoreValue.h
//  L1003_优化本地存储
//
//  Created by TonyEarth on 16/5/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreValue : NSObject

/**
 *  获取实例（单例的）
 *
 *  @return 实例
 */
+ (StoreValue *)sharedInstance;

/**
 *  存储数据
 *
 *  @param value 数据
 *  @param key   索引
 */
- (void)storeValue:(id)value withKey:(NSString *)key;

/**
 *  通过key获取存储的数据
 *
 *  @param key 索引
 *
 *  @return 数据
 */
- (id)valueWithKey:(NSString *)key;

@end
