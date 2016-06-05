//
//  AbstractEngine.h
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AbstractEngine <NSObject>
@required

/**
 *  设置引擎的尺寸
 *
 *  @param scale 尺寸
 */
- (void)engineScale:(CGFloat)scale;

/**
 *  设置引擎的重量
 *
 *  @param kg 重量
 */
- (void)engineWeight:(CGFloat)kg;

/**
 *  信息
 *
 *  @return 引擎信息
 */
- (NSString *)infomation;
@end
