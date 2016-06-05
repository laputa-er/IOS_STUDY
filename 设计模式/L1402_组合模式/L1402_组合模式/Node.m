//
//  Node.m
//  L1402_组合模式
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Node.h"
@interface Node ()
/**
 *  子节点集合
 */
@property (nonatomic, strong) NSMutableArray <Node *>*childNodes;

@end

@implementation Node

- (instancetype)init {
    if (self = [super init]) {
        self.childNodes = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)nodeWithNodeName:(NSString *)nodeName {
    Node *node = [[[self class] alloc] init];
    node.nodeName = nodeName;
    return node;
}

- (void)addNode:(Node *)node {
    [self.childNodes addObject:node];
}

- (void)removeNode:(Node *)node {
    [self.childNodes removeObject:node];
}

- (Node *)nodeAtIndex:(NSInteger)index {
    if (index >= self.childNodes.count) {
        return nil;
    }
    else {
        return self.childNodes[index];
    }
}
- (void)operation {
    NSLog(@"nodeName --> %@", self.nodeName);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"[Node] - %@", self.nodeName];
}

@end
