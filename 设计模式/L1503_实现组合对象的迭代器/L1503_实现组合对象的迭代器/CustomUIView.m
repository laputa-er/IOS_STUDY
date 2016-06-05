//
//  CustomUIView.m
//  L1503_实现组合对象的迭代器
//
//  Created by TonyEarth on 16/6/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "CustomUIView.h"
#import "LinkedList.h"
@interface CustomUIView ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *field;

@property (nonatomic, strong) LinkedList *list;
@property (nonatomic, strong) Node *currentNode;
@end

@implementation CustomUIView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 创建控件
        self.button = [[UIButton alloc] initWithFrame:self.bounds];
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.field = [[UITextField alloc] initWithFrame:self.bounds];
        
        // 添加空间
        [self addSubview:self.button];
        [self addSubview:self.label];
        [self addSubview:self.field];
        
        // 添加到链表
        self.list = [[LinkedList alloc] init];
        [self.list addItem:self.button];
        [self.list addItem:self.label];
        [self.list addItem:self.field];
        
        // 设置当前节点为链表的头节点
        self.currentNode = self.list.headNode;
    }
    return self;
}

#pragma mark - 采纳协议
- (void)resetIterator {
    self.currentNode = self.list.headNode;
}

- (id)nextObject {
    self.currentNode = self.currentNode.nextNode;
    return self.currentNode;
}

@end
