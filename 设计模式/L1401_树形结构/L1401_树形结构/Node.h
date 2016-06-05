//
//  Node.h
//  L1401_树形结构
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
/**
 *  当前节点名
 */
@property (nonatomic, strong) NSString *nodeName;

/**
 *  左节点
 */
@property (nonatomic, strong) Node *leftNode;

/**
 *  右节点
 */
@property (nonatomic, strong) Node *rightNode;

/**
 *  便利构造器
 *
 *  @param nodeName 节点名字
 *
 *  @return 节点
 */
+ (instancetype)nodeWithName:(NSString *)nodeName;
@end
