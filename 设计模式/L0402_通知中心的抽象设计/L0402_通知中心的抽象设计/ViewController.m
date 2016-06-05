//
//  ViewController.m
//  L0402_通知中心的抽象设计
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "SubscriptionServiceCenter.h"

static NSString *SCIENCE = @"SCIENCE";

@interface ViewController () <SubscriptionServiceCenterProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建订阅号
    [SubscriptionServiceCenter createSubscriptionNumber:SCIENCE];
    
    // 添加订阅的用户到指定的刊物
    [SubscriptionServiceCenter addCustomer:self
                    withSubscriptionNumber:SCIENCE];
    
    // 发型机构发送刊物
    [SubscriptionServiceCenter sendMessage:@"V1.0"
                      toSubscriptionNumber:SCIENCE];
}

#pragma mark - 采纳协议 SubscriptionServiceCenterProtocol
// 发行机构发送刊物时触发该方法的调用
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber {
    NSLog(@"%@ %@", message, subscriptionNumber);
}

@end
