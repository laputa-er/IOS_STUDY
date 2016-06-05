//
//  SubscriptionServiceCenterProtocol.h
//  L0402_通知中心的抽象设计
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubscriptionServiceCenterProtocol <NSObject>

@required
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber;

@end
