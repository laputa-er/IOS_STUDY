//
//  Dealer.m
//  L0901_代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Dealer.h"

@implementation Dealer

// 采纳协议，实现方法
- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count {
    NSLog(@"%ld", (long)count);
}

@end
