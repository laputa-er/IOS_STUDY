//
//  Customer.h
//  L0901_代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Customer;
// 代理协议
@protocol CustomerDelegate <NSObject>

@required
- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count;

@end


@interface Customer : NSObject

// 代理对象(经销商)
@property (nonatomic, weak) id <CustomerDelegate> delegate;

// 购买
- (void)buyItemCount:(NSInteger)count;

@end
