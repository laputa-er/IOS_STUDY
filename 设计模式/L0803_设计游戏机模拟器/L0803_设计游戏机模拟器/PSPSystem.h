//
//  PSPSystem.h
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AbstractSystem.h"

@interface PSPSystem : AbstractSystem

/* XO按钮 */
- (void)command_X;
- (void)command_O;

@end
