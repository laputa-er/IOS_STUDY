//
//  MementoCenter.h
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"

@interface MementoCenter : NSObject

/**
 *  save the object state
 *
 *  @param object object
 *  @param key    key
 */
+ (void)saveMementoObject:(id <MementoCenterProtocol>)object withKey:(NSString *)key;

/**
 *  get the object state
 *
 *  @param key key
 *
 *  @return object
 */
+ (id)mementoObjectWithKey:(NSString *)key;

@end
