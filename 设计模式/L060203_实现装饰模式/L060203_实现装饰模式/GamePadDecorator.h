//
//  GamePadDecorator.h
//  L060203_实现装饰模式
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePad.h"

@interface GamePadDecorator : NSObject

/**
 *  上下左右的操作
 */
- (void)up;
- (void)down;
- (void)left;
- (void)right;

/**
 *  选择与开始的操作
 */
- (void)select;
- (void)start;

/**
 *  按钮 A + B + X + Y
 */
- (void)commandA;
- (void)commandB;
- (void)commandX;
- (void)commandY;


@end
