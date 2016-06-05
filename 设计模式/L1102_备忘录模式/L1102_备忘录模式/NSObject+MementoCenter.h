//
//  NSObject+MementoCenter.h
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MementoCenter)

/**
 *  存储状态
 *
 *  @param key 键值
 */
- (void)saveStateWithKey:(NSString *)key;

/**
 *  恢复状态
 *
 *  @param key 键值
 */
- (void)recoverFromStateWithKey:(NSString *)key;

@end
