//
//  LinkedList.h
//  L1503_实现组合对象的迭代器
//
//  Created by TonyEarth on 16/6/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject

/**
 *  头节点
 */
@property (nonatomic, strong, readonly) Node *headNode;

/**
 *  有几个节点
 */
@property (nonatomic, readonly) NSInteger numberOfNodes;

/**
 *  添加挂载的对象(没有相应的可挂载的节点就创建一个)
 *
 *  @param item 节点挂载的对象
 */
- (void)addItem:(id)item;

@end
