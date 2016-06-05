//
//  MementoCenterProtocol.h
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MementoCenterProtocol <NSObject>

@required
/**
 *  get state
 *
 *  @return state
 */
- (id)currentState;

/**
 *  recover from state
 *
 *  @param state state
 */
- (void)recoverFromState:(id)state;

@end
