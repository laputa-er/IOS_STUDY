//
//  IteratorProtocol.h
//  L1503_实现组合对象的迭代器
//
//  Created by TonyEarth on 16/6/1.
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

/**
 *  重置迭代器(重置指针)
 */
- (void)resetIterator;

@end
