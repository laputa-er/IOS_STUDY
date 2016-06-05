//
//  GBAImplementor.m
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "GBAImplementor.h"

@implementation GBAImplementor

- (void)loadCommand:(EcommandType)command {
    switch (command) {
        case kUp:
            NSLog(@"GBA up");
            break;
        case kDown:
            NSLog(@"GBA down");
        case kLeft:
            NSLog(@"GBA left");
        case kRight:
            NSLog(@"GBA right");
        case kA:
            NSLog(@"GBA a");
        case kB:
            NSLog(@"GBA b");
        default:
            NSLog(@"GBA NONE");
            break;
    }
}
@end
