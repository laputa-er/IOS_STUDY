//
//  JKGroupModel.h
//  L10QQ列表展示
//
//  Created by TonyEarth on 16/3/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKFriendsModel;
@interface JKGroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) JKFriendsModel *friendModel;
@property (nonatomic, assign) BOOL isOpen;// 是否是展开的

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)GroupWithDict:(NSDictionary *)dict;

@end
