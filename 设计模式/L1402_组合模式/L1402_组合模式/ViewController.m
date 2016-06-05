//
//  ViewController.m
//  L1402_组合模式
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"

@interface ViewController ()
@property (nonatomic, strong) Node *rootNode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 组合模式
    // 将对象组合成树形结构以表示“部分－整体”的层次结构，组合模式使得用户对单个对象和组合对象的使用具有一致性。掌握组合模式的重点是要理解清楚“部分／整体”还有“单个对象”与“组合对象”的含义
    
    // 创建根节点
    self.rootNode = [Node nodeWithNodeName:@"A"];
    
    // 创建第一级子节点（A -> B, C, D）
    [self.rootNode addNode:[Node nodeWithNodeName:@"B"]];
    Node *c = [Node nodeWithNodeName:@"C"];
    [self.rootNode addNode:c];
    [self.rootNode addNode:[Node nodeWithNodeName:@"D"]];
    
    // 创建第二级子节点
    [c addNode:[Node nodeWithNodeName:@"E"]];
    [c addNode:[Node nodeWithNodeName:@"F"]];
    
    NSLog(@"%@", self.rootNode.childNodes);
    NSLog(@"%@", c.childNodes);
}

@end
