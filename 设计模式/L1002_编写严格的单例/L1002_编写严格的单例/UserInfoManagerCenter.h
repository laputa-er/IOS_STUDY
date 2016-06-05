//
//  UserInfoManagerCenter.h
//  L1002_编写严格的单例
//
//  Created by TonyEarth on 16/5/26.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManagerCenter : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
+ (instancetype)managerCenter;
@end
