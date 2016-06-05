//
//  CheatGamePadDecorator.m
//  L060203_实现装饰模式
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "CheatGamePadDecorator.h"

@implementation CheatGamePadDecorator

- (void)cheat {
    
    [self up];
    [self down];
    [self up];
    [self down];
    [self left];
    [self right];
    [self left];
    [self right];
    [self commandA];
    [self commandB];
    [self commandA];
    [self commandB];
}

@end
