//
//  CoinGamePadDecorator.h
//  L060203_实现装饰模式
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "GamePadDecorator.h"

@interface CoinGamePadDecorator : GamePadDecorator

/**
 *  游戏币
 */
@property (nonatomic) NSInteger  coin;

@end
