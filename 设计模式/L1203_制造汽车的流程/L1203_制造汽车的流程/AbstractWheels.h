//
//  AbstractWheels.h
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AbstractWheels <NSObject>
@required
/**
 *  设置轮子的数目
 *
 *  @param number 数目
 */
- (void)wheelsNumber:(NSNumber *)number;

/**
 *  信息
 *
 *  @return 轮子信息
 */
- (NSString *)infomation;
@end
