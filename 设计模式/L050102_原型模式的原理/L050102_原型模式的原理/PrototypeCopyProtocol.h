//
//  PrototypeCopyProtocol.h
//  L050102_原型模式的原理
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PrototypeCopyProtocol <NSObject>

@required
/**
 *  复制自己
 *
 *  @return 返回一个拷贝
 */
- (id)clone;

@end
