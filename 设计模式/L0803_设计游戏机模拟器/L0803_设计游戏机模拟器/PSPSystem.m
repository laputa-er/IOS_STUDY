//
//  PSPSystem.m
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "PSPSystem.h"

@implementation PSPSystem

- (void)loadSystem {
    NSLog(@"PSPSystem");
}

- (void)command_X {
    [self.implementor loadCommand:KX];
}

- (void)command_O {
    [self.implementor loadCommand:KO];
}

@end
