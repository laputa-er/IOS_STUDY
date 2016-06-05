//
//  FactoryManager.h
//  L0703_抽象工厂
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFactory.h"
#import "AppleFactory.h"
#import "GoogleFactory.h"

typedef enum : NSUInteger {
    kApple = 0x11,
    kGoogle,
} EFactoryType;

@interface FactoryManager : NSObject

/**
 *  获取具体工厂
 *
 *  @param factoryType 工厂类型
 *
 *  @return 工厂实例
 */
+ (BaseFactory *)factoryWithBrand:(EFactoryType)factoryType;

@end
