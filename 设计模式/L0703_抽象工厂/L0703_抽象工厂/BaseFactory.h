//
//  BaseFactory.h
//  L0703_抽象工厂
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasePhone.h"
#import "BaseWatch.h"

@interface BaseFactory : NSObject

/**
 *  创建手机
 *
 *  @return 手机实例
 */
- (BasePhone *)createPhone;

/**
 *  创建手表
 *
 *  @return 手表实例
 */
- (BaseWatch *)createWatch;

@end
