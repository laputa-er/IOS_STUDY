//
//  ConcreteProxy.h
//  L0903_用 NSProxy 实现代理模式
//
//  Created by TonyEarth on 16/5/23.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AbastractProxy.h"
#import "MessageProtocol.h"

@interface ConcreteProxy : AbastractProxy <MessageProtocol>

@end
