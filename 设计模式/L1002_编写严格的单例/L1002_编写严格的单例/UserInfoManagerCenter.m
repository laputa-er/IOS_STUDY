//
//  UserInfoManagerCenter.m
//  L1002_编写严格的单例
//
//  Created by TonyEarth on 16/5/26.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "UserInfoManagerCenter.h"
static UserInfoManagerCenter *center = nil;
@implementation UserInfoManagerCenter

+ (instancetype)managerCenter {
    static dispatch_once_t predicate;
    
    // 只执行一次
    dispatch_once(&predicate, ^{
        center = (UserInfoManagerCenter *)@"UserInfoManagerCenter";
        center = [[UserInfoManagerCenter alloc] init];
    });
    
    /* 防止子类使用 */
    // 获取当前实例的类名
    NSString *classString = NSStringFromClass([self class]);
    // 是子类调用该方法则中断程序
    if ([classString isEqualToString:@"UserInfoManagerCenter"] == NO) {
        NSParameterAssert(nil);
    }
    return center;
}

- (instancetype)init {
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"UserInfoManagerCenter"]) {
        
        if (self = [super init]) {
            /* 防止子类使用 */
            NSString *classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"UserInfoManagerCenter"] == NO) {
                NSParameterAssert(nil);
            }
        }
        return self;
    }
    else {
        return nil;
    }
}
@end
