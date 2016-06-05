//
//  Node.h
//  L1402_组合模式
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
/**
 *  节点名字
 */
@property (nonatomic, strong) NSString *nodeName;

/**
 *  便利构造器
 *
 *  @param nodeName 节点名字
 *
 *  @return 节点
 */
+ (instancetype)nodeWithNodeName:(NSString *)nodeName;

@property (nonatomic, strong, readonly) NSMutableArray <Node *>*childNodes;

/**
 *  添加子节点
 *
 *  @param nodes 节点
 */
- (void)addNode:(Node *)nodes;

/**
 *  删除字节点
 *
 *  @param node 节点
 */
- (void)removeNode:(Node *)node;

- (Node *)nodeAtIndex:(NSInteger)index;

/**
 *  打印 Node
 */
- (void)operation;

@end
