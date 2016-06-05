//
//  JKHero.h
//  L04LoL英雄展示
//
//  Created by TonyEarth on 16/2/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKHero : NSObject

// 成员属性
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *icon;

// 构造器
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)heroWithDict:(NSDictionary *)dict;

@end
