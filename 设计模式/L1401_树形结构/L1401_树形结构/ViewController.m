//
//  ViewController.m
//  L1401_树形结构
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"

@interface ViewController ()

/**
 *  跟节点
 */
@property (nonatomic, strong) Node *rootNode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建根节点
    self.rootNode = [Node nodeWithName:@"A"];
    
    // 插入节点
    [self insertNodeTree:self.rootNode
                    node:[Node nodeWithName:@"B"]];
    [self insertNodeTree:self.rootNode
                    node:[Node nodeWithName:@"C"]];
    [self insertNodeTree:self.rootNode
                    node:[Node nodeWithName:@"D"]];
    [self insertNodeTree:self.rootNode
                    node:[Node nodeWithName:@"E"]];
    [self insertNodeTree:self.rootNode
                    node:[Node nodeWithName:@"F"]];
    
    // 遍历二叉树
    [self treeInfomationWithNode:self.rootNode];
}

/**
 * 往根节点上插入节点(从上到下，从左到右)
 *
 *  @param tree 跟节点
 *  @param node 被插入的节点
 */
- (void)insertNodeTree:(Node *)tree node:(Node *)node {
    // 设置节点
    if (tree.leftNode == nil) {
        tree.leftNode = node;
    }
    // 设置右节点
    else if (tree.rightNode == nil) {
        tree.rightNode = node;
    }
    // 将节点添加到树中
    else {
        [self insertNodeTree:tree.leftNode
                        node:node];
    }
}

/**
 *  便利二叉树（左-中-右，递归）
 *
 *  @param node 根节点
 */
- (void)treeInfomationWithNode:(Node *)node {
    if (node.leftNode) {
        [self treeInfomationWithNode:node.leftNode];
    }
    NSLog(@"%@", node.nodeName);
    
    if (node.rightNode) {
        [self treeInfomationWithNode:node.rightNode];
    }
}

@end
