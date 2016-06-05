//
//  FactoryManager.m
//  L0703_抽象工厂
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "FactoryManager.h"

@implementation FactoryManager

+ (BaseFactory *)factoryWithBrand:(EFactoryType)factoryType {
    BaseFactory *factory = nil;
    if (factoryType == kApple) {
        factory = [[AppleFactory alloc] init];
    }
    else if (factoryType == kGoogle) {
        factory = [[GoogleFactory alloc] init];
    }
    return factory;
}

@end
