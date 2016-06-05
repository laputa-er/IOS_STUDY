//
//  ViewController.m
//  L0902_代理与协议
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "TCPProtocol.h"
#import "Model.h"

@interface ViewController ()

@property (nonatomic) NSInteger sourcePort;
@property (nonatomic) NSInteger destinationPort;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取 tcp 数据源
    Model *tcpData = [[Model alloc] init];
    // 通过 tcp 数据源获取 tcp 数据
    [self accessTCPData:tcpData];
}

/**
 *  获取 tcp 数据
 *
 *  @param data 采纳了 TCP 协议的数据
 */
- (void)accessTCPData:(id <TCPProtocol>)data {
    self.sourcePort = [data sourcePort];
    self.destinationPort = [data destinationPort];
}

@end
