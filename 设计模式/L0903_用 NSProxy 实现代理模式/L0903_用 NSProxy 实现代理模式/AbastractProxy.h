//
//  AbastractProxy.h
//  L0903_用 NSProxy 实现代理模式
//
//  Created by TonyEarth on 16/5/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbastractProxy : NSProxy

// 代理对象
@property (nonatomic, weak) id delegate;
@end
