//
//  ViewController.m
//  L0903_用 NSProxy 实现代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "ConcreteProxy.h"

@interface ViewController () <MessageProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建代理
    ConcreteProxy *proxy = [ConcreteProxy alloc];
    // 设置代理对象
    proxy.delegate = self;
    
    // 派发消息
    [proxy helloWorld];
    [proxy goodBye];
}

- (void)helloWorld {
    NSLog(@"xxxxx");
}

@end
