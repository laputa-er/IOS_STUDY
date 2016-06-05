//
//  UserInfoManagerCenter.h
//  L1001_单例模式
//
//  Created by TonyEarth on 16/5/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManagerCenter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

+ (instancetype)managerCenter;

@end
