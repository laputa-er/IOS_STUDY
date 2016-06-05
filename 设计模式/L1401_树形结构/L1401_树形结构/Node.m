//
//  Node.m
//  L1401_树形结构
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (instancetype)nodeWithName:(NSString *)nodeName {
    // 创建节点实例（考虑子类的情况，使用 self class 创建实例）
    Node *node = [[[self class] alloc] init];
    node.nodeName = nodeName;
    
    return node;
}

@end
