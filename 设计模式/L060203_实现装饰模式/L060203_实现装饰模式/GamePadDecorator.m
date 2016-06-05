//
//  GamePadDecorator.m
//  L060203_实现装饰模式
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "GamePadDecorator.h"
@interface GamePadDecorator ()
@property (nonatomic, strong) GamePad *gamePad;
@end

@implementation GamePadDecorator

- (instancetype)init {
    if (self = [super init]) {
        self.gamePad = [[GamePad alloc] init];
    }
    return self;
}

- (void)up {
    
    [self.gamePad up];
}

- (void)down {
    
    [self.gamePad down];
}

- (void)left {
    
    [self.gamePad left];
}

- (void)right {
    
    [self.gamePad right];
}

- (void)select {
    
    [self.gamePad select];
}

- (void)start {
    
    [self.gamePad start];
}

- (void)commandA {
    
    [self.gamePad commandA];
}

- (void)commandB {
    
    [self.gamePad commandB];
}

- (void)commandX {
    
    [self.gamePad commandX];
}

- (void)commandY {
    
    [self.gamePad commandY];
}

@end
