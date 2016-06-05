//
//  Apple.h
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"

@interface Apple : NSObject <MementoCenterProtocol>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

@end
