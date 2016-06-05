//
//  JKQuestionInfo.h
//  L07超级猜图
//
//  Created by TonyEarth on 16/3/5.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JKQuestionInfo : NSObject
// 属性
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong, readonly) UIImage *image;

// 构造器
- (instancetype)initWithDict:(NSDictionary *)dict;
// 类方法（工厂方法）
+ (instancetype)questionWithDict:(NSDictionary *)doct;

// 通过 plist 创建 options
+ (NSArray *)questions;

@end
