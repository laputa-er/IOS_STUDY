//
//  DarkerCommand.m
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "DarkerCommand.h"

@interface DarkerCommand ()
@property (nonatomic, weak) Receiver *receiver;// 接收器
@property (nonatomic) CGFloat parameter;// 参数
@end

@implementation DarkerCommand

- (instancetype)initWithReceiver:(Receiver *)receiver paramter:(CGFloat)paramter {
    if(self = [super init]) {
        self.parameter = paramter;
        self.receiver = receiver;
    }
    return self;
}

- (void)excute {
    [self.receiver makeDarker:self.parameter];
}

- (void)rollBackExcute {
    [self.receiver makeLighter:self.parameter];
}
@end
