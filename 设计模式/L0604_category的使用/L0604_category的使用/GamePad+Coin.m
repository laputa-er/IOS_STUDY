//
//  GamePad+Coin.m
//  L0604_category的使用
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "GamePad+Coin.h"
#import <objc/runtime.h>
#import <Foundation/Foundation.h>

@implementation GamePad (Coin)

// 作为类和属性之间的关联key
static const NSString *_coinStr = @"_coinStr";

- (void)setCoin:(NSInteger)coin {
    // 将当前类（GamePad）和 coin 属性关联在一起
    // 也就是额外添加了一个属性
    objc_setAssociatedObject(self, (__bridge const void *)_coinStr, @(coin), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)coin {
    // 通过key扩区绑定到当前类的属性的值
    NSNumber *number = objc_getAssociatedObject(self, (__bridge const void *)_coinStr);
    
    return number.integerValue;
}

@end
