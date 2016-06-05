//
//  AbstractSystem.m
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AbstractSystem.h"

@implementation AbstractSystem

- (void)loadSystem
{
    
}

- (void)command_up
{
    [self.implementor loadCommand:kUp];
}
- (void)command_down
{
    [self.implementor loadCommand:kDown];
}
- (void)command_left
{
    [self.implementor loadCommand:kLeft];
}
- (void)command_right
{
    [self.implementor loadCommand:kRight];
}
- (void)command_a
{
    [self.implementor loadCommand:kA];
}
- (void)command_b
{
    [self.implementor loadCommand:kB];
}

@end
