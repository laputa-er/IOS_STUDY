//
//  LinkedListIterator.m
//  L1502_迭代器模式
//
//  Created by TonyEarth on 16/5/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "LinkedListIterator.h"
@interface LinkedListIterator ()

@property (nonatomic, strong) LinkedList *linkedList;
@property (nonatomic, strong) Node *currentNode;

@end

@implementation LinkedListIterator

+ (instancetype)linkedListIteratorWithLinkedList:(LinkedList *)linkedList {
    // 创建迭代器实例
    LinkedListIterator *linkedListIterator = [LinkedListIterator new];
    // 设置要迭代的链表
    linkedListIterator.linkedList = linkedList;
    // 设置当前迭代位置
    linkedListIterator.currentNode = linkedList.headNode;
    
    return linkedListIterator;
}

#pragma mark - 采纳协议
- (id)nextObject {
    self.currentNode = self.currentNode.nextNode;
    return self.currentNode;
}
@end
