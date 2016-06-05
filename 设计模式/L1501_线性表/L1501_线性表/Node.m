//
//  Node.m
//  L1501_线性表
//
//  Created by TonyEarth on 16/5/31.
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
