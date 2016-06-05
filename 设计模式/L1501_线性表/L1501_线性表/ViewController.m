//
//  ViewController.m
//  L1501_线性表
//
//  Created by TonyEarth on 16/5/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "LinkedList.h"

@interface ViewController ()
@property (nonatomic, strong) LinkedList *linkedList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 初始化链表
    self.linkedList = [[LinkedList alloc] init];
    
    // 添加节点
    [self.linkedList addItem:@"A"];
    [self.linkedList addItem:@"B"];
    [self.linkedList addItem:@"C"];
    [self.linkedList addItem:@"D"];
    
    // 打印节点数目
    NSLog(@"number of node = %ld", (long)self.linkedList.numberOfNodes);
    
    // 遍历节点
    Node *point = self.linkedList.headNode;
    do {
        NSLog(@"item -> %@", point.item);
        point = point.nextNode;
    } while (point);
}

@end
