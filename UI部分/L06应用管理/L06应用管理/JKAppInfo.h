//
//  JKAppInfo.h
//  L06应用管理
//
//  Created by baidu on 16/2/29.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JKAppInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong, readonly) UIImage *image;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

@end
