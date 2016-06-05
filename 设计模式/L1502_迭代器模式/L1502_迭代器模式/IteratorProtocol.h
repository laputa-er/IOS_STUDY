//
//  IteratorProtocol.h
//  L1502_迭代器模式
//
//  Created by TonyEarth on 16/5/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IteratorProtocol <NSObject>

@required

/**
 *  下一个对象
 *
 *  @return 对象
 */
-(id)nextObject;

@end
