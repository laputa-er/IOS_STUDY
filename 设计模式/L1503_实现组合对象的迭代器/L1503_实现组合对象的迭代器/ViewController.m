//
//  ViewController.m
//  L1503_实现组合对象的迭代器
//
//  Created by TonyEarth on 16/6/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "CustomUIView.h"
#import "Node.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CustomUIView *customUIView = [[CustomUIView alloc] initWithFrame:self.view.bounds];
    Node *node = nil;
    
    [customUIView resetIterator];
    while (node = [customUIView nextObject]) {
        NSLog(@"%@", node.item);
    }
}

@end
