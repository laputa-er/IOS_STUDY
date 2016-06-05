//
//  JKFriendsModel.h
//  L10QQ列表展示
//
//  Created by TonyEarth on 16/3/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKFriendsModel : NSObject

@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *intro;
@property (nonatomic, assign) BOOL isVip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;

@end
