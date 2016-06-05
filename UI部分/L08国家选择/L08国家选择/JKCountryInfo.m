//
//  JKCountryInfo.m
//  L08国家选择
//
//  Created by TonyEarth on 16/3/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKCountryInfo.h"

@implementation JKCountryInfo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)CountryWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
