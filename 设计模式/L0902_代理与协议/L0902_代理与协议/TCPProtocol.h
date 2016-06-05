//
//  TCPProtocol.h
//  L0902_代理与协议
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCPProtocol <NSObject>
@required
// 获取源端口号
- (NSInteger)sourcePort;
// 获取目的地端口号
- (NSInteger)destinationPort;

@end
