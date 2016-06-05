//
//  BaseCopyObject.h
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCopyObject : NSObject <NSCopying>

/**
 *  根据内存区域复制
 *  子类不要重载！
 *  @param zone 要复制到的内存区域
 *
 *  @return 复制的对象
 */
- (id)copyWithZone:(NSZone *)zone;

/**
 *  通过对象引用复制
 *
 *  @param object 要复制到的目标对象
 */
- (void)copyOperationWithObject:(id)object;

@end
