//
//  NewCardModelAdapter.m
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "NewCardModelAdapter.h"
#import "NewCardModel.h"

@implementation NewCardModelAdapter
- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}
#pragma mark - 重写抽象父类的方法
- (NSString *)name {
    NewCardModel *data = self.data;
    return data.name;
}

- (UIColor *)lineColor {
    NewCardModel *data = self.data;
    
    if ([data.colorHexString isEqualToString:@"black"]) {
        return [UIColor blackColor];
    }
    else {
        return [UIColor redColor];
    }
}

- (NSString *)phoneNumber {
    NewCardModel *data = self.data;
    return data.phoneNumber;
}

@end
