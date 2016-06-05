//
//  AbstractSystem.h
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractImplementor.h"

@interface AbstractSystem : NSObject

/**
 *  执行者
 */
@property (nonatomic, strong) AbstractImplementor *implementor;

/**
 *  加载系统
 */
- (void)loadSystem;

- (void)command_up;
- (void)command_down;
- (void)command_left;
- (void)command_right;
- (void)command_a;
- (void)command_b;

@end
