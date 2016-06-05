//
//  Node.h
//  L1501_线性表
//
//  Created by TonyEarth on 16/5/31.
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
