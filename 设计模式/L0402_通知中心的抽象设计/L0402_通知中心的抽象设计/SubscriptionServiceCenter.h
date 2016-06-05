//
//  SubscriptionServiceCenter.h
//  L0402_通知中心的抽象设计
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubscriptionServiceCenterProtocol.h"

@interface SubscriptionServiceCenter : NSObject

#pragma mark - 维护订阅信息
/**
 *  创建订阅号
 *
 *  @param subscriptionNumber 订阅号码
 */
+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber;

/**
 *  移除订阅号
 *
 *  @param subscriptionNumber 订阅号码
 */
+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber;

#pragma mark - 维护客户信息
/**
 *  添加客户到具体的订阅号当中
 *
 *  @param customer           客户
 *  @param subscriptionNumber 订阅号码
 */
+ (void)addCustomer:(id <SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;

/**
 *  从具体的订阅号中移除客户
 *
 *  @param customer           <#customer description#>
 *  @param subscriptionNumber <#subscriptionNumber description#>
 */
+ (void)removeCustomer:(id <SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;

#pragma mark - 发送消息
+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber;

@end
