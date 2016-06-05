//
//  ModelAdapter.m
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ModelAdapter.h"
#import "Model.h"
@implementation ModelAdapter
- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

#pragma mark - 实重写继承子抽象类的方法
- (NSString *)name {
    Model *data = self.data;
    return data.name;
}

- (UIColor *)lineColor {
    Model *data = self.data;
    return data.lineColor;
}

- (NSString *)phoneNumber {
    Model *data = self.data;
    return data.phoneNumber;
}

@end
