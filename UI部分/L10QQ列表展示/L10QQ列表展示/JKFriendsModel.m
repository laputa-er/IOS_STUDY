//
//  JKFriendsModel.m
//  L10QQ列表展示
//
//  Created by TonyEarth on 16/3/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKFriendsModel.h"

@implementation JKFriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
