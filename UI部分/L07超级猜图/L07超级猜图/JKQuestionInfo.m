//
//  JKQuestionInfo.m
//  L07超级猜图
//
//  Created by TonyEarth on 16/3/5.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKQuestionInfo.h"

@implementation JKQuestionInfo
{
    UIImage *_image;
}

// 构造器
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

// 类方法（工厂方法）
+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

// 为_image手动定义 get
- (UIImage *)image
{
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

// 通过 plist 创建 options
+ (NSArray *)questions
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    // 保证每次调用该方法获取的都是全新的数组
    return [arrayM copy];
}

@end
