//
//  CommandProtocol.h
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receiver.h"

@protocol CommandProtocol <NSObject>
@required

/**
 *  执行命令
 */
- (void)excute;

/**
 *  回滚命令
 */
- (void)rollBackExcute;

@end
