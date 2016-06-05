//
//  NSObject+StoreValue.h
//  L1003_优化本地存储
//
//  Created by TonyEarth on 16/5/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (StoreValue)
- (void)storeValueWithKey:(NSString *)key;
+ (id)valueByKey:(NSString *)key;
@end
