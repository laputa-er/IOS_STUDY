//
//  JKGroupModel.m
//  L10QQ列表展示
//
//  Created by TonyEarth on 16/3/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKGroupModel.h"
#import "JKFriendsModel.h"
@implementation JKGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            JKFriendsModel *model = [JKFriendsModel friendWithDict:dict];
            [muArray addObject:model];
        }
        self.friends = muArray;
    }
    return self;
}

+ (instancetype)GroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
