//
//  LinkedListIterator.h
//  L1502_迭代器模式
//
//  Created by TonyEarth on 16/5/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "IteratorProtocol.h"

@interface LinkedListIterator : NSObject <IteratorProtocol>
/**
 *  便利构造器
 *
 *  @param linkedList 链表
 *
 *  @return 迭代器
 */
+ (instancetype)linkedListIteratorWithLinkedList:(LinkedList *)linkedList;

@end
