//
//  UserInfoManagerCenter.m
//  L1001_单例模式
//
//  Created by TonyEarth on 16/5/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "UserInfoManagerCenter.h"

@implementation UserInfoManagerCenter

/**
 *  获取单例
 *
 *  @return 单例实例
 */
+ (instancetype)managerCenter {
    // 使用全局变量保存单例实例
    static UserInfoManagerCenter *center = nil;
    static dispatch_once_t predict;
    
    // 只执行一次
    dispatch_once(&predict, ^{
        center = [[UserInfoManagerCenter alloc] init];
    });
    
    return center;
}

@end
