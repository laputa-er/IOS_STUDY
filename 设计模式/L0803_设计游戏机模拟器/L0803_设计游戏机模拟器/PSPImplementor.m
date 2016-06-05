//
//  PSPImplementor.m
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "PSPImplementor.h"

@implementation PSPImplementor
- (void)loadCommand:(EcommandType)command {
    
    switch (command) {
            
        case kUp:
            
            NSLog(@"PSP up");
            break;
            
        case kDown:
            
            NSLog(@"PSP down");
            break;
            
        case kLeft:
            
            NSLog(@"PSP left");
            break;
            
        case kRight:
            
            NSLog(@"PSP right");
            break;
            
        case kA:
            
            NSLog(@"PSP A");
            break;
            
        case kB:
            
            NSLog(@"PSP B");
            break;
            
        case KO:
            
            NSLog(@"PSP O");
            break;
            
        case KX:
            
            NSLog(@"PSP X");
            break;
            
        default:
            NSLog(@"PSP None");
            break;
    }
}

@end
