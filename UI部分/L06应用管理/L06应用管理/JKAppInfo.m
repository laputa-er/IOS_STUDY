//
//  JKAppInfo.m
//  L06应用管理
//
//  Created by baidu on 16/2/29.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "JKAppInfo.h"

@implementation JKAppInfo
{
    UIImage *_image;// 通过定义为私有属性使其可在 image 方法中被访问
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

// 自定义 image 的set(因为 通过 @property 创建的 image 是只读的，因此不会自动生成 get)
// 注意：将访问 image 自定义为访问 _image
- (UIImage *)image
{
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

@end
