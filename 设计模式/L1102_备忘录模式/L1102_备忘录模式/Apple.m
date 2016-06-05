//
//  Apple.m
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Apple.h"

@implementation Apple

- (id)currentState {
    return @{@"name": self.name,
             @"age": self.age};
}

- (void)recoverFromState:(id)state {
    NSDictionary *data = state;
    
    self.name = data[@"name"];
    self.age = data[@"age"];
}
@end
