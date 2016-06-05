//
//  ViewController.m
//  L1502_迭代器模式
//
//  Created by TonyEarth on 16/5/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "LinkedList.h"
#import "LinkedListIterator.h"

@interface ViewController ()
@property (nonatomic, strong) LinkedList *list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /* 系统自身的集合和迭代器 */
    // 创建集合对象
    NSArray *datas = @[@"A", @"B", @"C", @"D"];
    
    // 从集合对象创建迭代器
    NSEnumerator *iterator = [datas objectEnumerator];
    
    // 通过迭代器访问元素
    id arrObj = nil;
    while (arrObj = [iterator nextObject]) {
        NSLog(@"%@", arrObj);
    }
    
    /* 自定义的集合和迭代器 */
    self.list = [[LinkedList alloc] init];
    [self.list addItem:@"A"];
    [self.list addItem:@"B"];
    [self.list addItem:@"C"];
    [self.list addItem:@"D"];
    
    // 从集合对象创建迭代器
    LinkedListIterator *linkedIterator = [LinkedListIterator linkedListIteratorWithLinkedList:self.list];
    
    // 通过迭代器遍历元素
    Node *node = nil;
    while (node = [linkedIterator nextObject]) {
        NSLog(@"%@", node.item);
    }
}

@end
