//
//  AbstractDoor.h
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AbstractDoor <NSObject>
@required
/**
 *  设置门的颜色
 *
 *  @param color 颜色
 */
- (void)doorColor:(UIColor *)color;

/**
 *  信息
 *
 *  @return 轮子的信息
 */
- (NSString *)infomation;
@end
