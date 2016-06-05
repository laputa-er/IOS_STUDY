//
//  LighterCommand.m
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "LighterCommand.h"

@interface LighterCommand ()
@property (nonatomic, weak) Receiver *receiver;
@property (nonatomic)CGFloat parameter;

@end

@implementation LighterCommand

- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter {
    if (self = [super init]) {
        self.receiver = receiver;
        self.parameter = parameter;
    }
    return self;
}

- (void)excute {
    [self.receiver makeLighter:self.parameter];
}

- (void)rollBackExcute {
    [self.receiver makeDarker:self.parameter];
}
@end
