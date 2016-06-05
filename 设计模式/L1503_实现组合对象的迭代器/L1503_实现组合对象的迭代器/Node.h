//
//  Node.h
//  L1503_实现组合对象的迭代器
//
//  Created by TonyEarth on 16/6/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

/**
 *  指向下一个节点
 */
@property (nonatomic, strong) Node *nextNode;

/**
 *  节点挂载的对象
 */
@property (nonatomic, strong) id item;

/**
 *  便利构造器
 *
 *  @param item 节点挂载的对象
 *
 *  @return Node 对象
 */
+ (instancetype)nodeWithItem:(id)item;

@end
