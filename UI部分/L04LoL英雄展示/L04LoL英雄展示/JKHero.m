//
//  JKHero.m
//  L04LoL英雄展示
//
//  Created by TonyEarth on 16/2/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKHero.h"

@implementation JKHero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
//        self.icon = [dict[@"icon"] copy];
//        self.name = [dict[@"name"] copy];
//        self.intro = [dict[@"intro"] copy];
        [self setValuesForKeysWithDictionary:dict];// 利用 kvc
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
