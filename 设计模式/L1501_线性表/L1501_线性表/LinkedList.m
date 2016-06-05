//
//  LinkedList.m
//  L1501_线性表
//
//  Created by TonyEarth on 16/5/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList ()

@property (nonatomic, strong) Node *headNode;// 头节点
@property (nonatomic) NSInteger numberOfNodes;// 节点数量

@end

@implementation LinkedList

- (void)addItem:(id)item {
    if (self.headNode == nil) {
        // 创建头节点
        self.headNode = [Node nodeWithItem:item];
    }
    else {
        // 为头节点添加对象
        [self addItem:item node:self.headNode];
    }
    self.numberOfNodes++;
}

#pragma mark - 私有方法
/**
 *  挂载新数据到指定节点的下一个节点上
 *
 *  @param item 挂载的对象
 *  @param node 节点
 */
- (void)addItem:(id)item node:(Node *)node {
    // 没有下一个节点就创建一个节点
    if (node.nextNode == nil) {
        node.nextNode = [Node nodeWithItem:item];
    }
    // 有下一个节点就挂载在上面
    else {
        [self addItem:item node:node.nextNode];
    }
}
@end
