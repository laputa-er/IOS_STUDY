//
//  BusinessCardAdapter.m
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BusinessCardAdapter.h"

@implementation BusinessCardAdapter

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

#pragma mark - 采纳协议，提供空实现
- (NSString *)name {
    return nil;
}

- (UIColor *)lineColor {
    return nil;
}

- (NSString *)phoneNumber {
    return nil;
}

@end
