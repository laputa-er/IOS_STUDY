//
//  JKCountryInfo.h
//  L08国家选择
//
//  Created by TonyEarth on 16/3/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKCountryInfo : NSObject

@property (nonatomic, strong) NSString *name;// 国家名字
@property (nonatomic, strong) NSString *icon;// 国旗（图片名）

// 构造器
- (instancetype)initWithDict: (NSDictionary *)dict;
// 工厂方法
+ (instancetype) CountryWithDict: (NSDictionary *)dict;

@end
