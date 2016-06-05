//
//  Customer.m
//  L0901_代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (void)buyItemCount:(NSInteger)count {
    // 确保设置了代理对象，且代理对象正确采纳了协议
    if (self.delegate && [self.delegate respondsToSelector:@selector(customer:buyItemCount:)]) {
        [self.delegate customer:self
                   buyItemCount:count];
    }
}
@end
