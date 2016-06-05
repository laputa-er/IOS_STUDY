//
//  ViewController.m
//  L0404_KVO与通知中心
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

#define SCIENCE @"SCIENCE"// 订阅号名

@interface ViewController ()
@property (nonatomic, strong)Model *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*1. Cocoa的 通知中心*/
    // 添加客户到指定的订阅号中
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCenterEvent:)
                                                 name:SCIENCE
                                               object:@"v1.0"];
    
    // 发送消息到指定的订阅号中
    [[NSNotificationCenter defaultCenter] postNotificationName:SCIENCE
                                                        object:@"V1.0"];
    
    /*2. KVO方式*/
    // 创建订阅中心
    self.model = [Model new];
    
    // 客户添加订阅中心的"name"服务：当name属性被修改时会发送消息给观察者
    [self.model addObserver:self
                 forKeyPath:@"name"
                    options:NSKeyValueObservingOptionNew
                    context:nil];
    // 订阅中心发送消息（通过修改 name 属性值）
    self.model.name = @"V1.0";
}

#pragma mark - 通过KVO该表属性时调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

#pragma mark -  当客户收到通知中心的消息时被调用的方法
- (void)notificationCenterEvent:(id)sender {
    NSLog(@"%@", sender);
}

#pragma mark - 释放资源
- (void)dealloc {
    // 从通知中心移除
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                              forKeyPath:SCIENCE];
    // 移除 KVO
    [self.model removeObserver:self forKeyPath:@"name"];
}
@end
