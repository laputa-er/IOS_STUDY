//
//  Node.m
//  L1503_实现组合对象的迭代器
//
//  Created by TonyEarth on 16/6/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (instancetype)nodeWithItem:(id)item {
    Node *node = [[[self class] alloc] init];
    node.item = item;
    
    return node;
}

@end
