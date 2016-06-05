//
//  ViewController.m
//  L0901_代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Customer.h"
#import "Dealer.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 顾客
    Customer *customer = [[Customer alloc] init];
    // 经销商
    Dealer *dealer = [[Dealer alloc] init];
    
    // 将经销商实例做为代理对象
    customer.delegate = dealer;
    
    // 客户购买（会代理到dealer的相应方法去处理）
    [customer buyItemCount:5];
}

@end
