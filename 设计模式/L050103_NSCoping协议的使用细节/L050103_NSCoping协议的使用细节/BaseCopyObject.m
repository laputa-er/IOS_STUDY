//
//  BaseCopyObject.m
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BaseCopyObject.h"

@implementation BaseCopyObject
- (id)copyWithZone:(NSZone *)zone {
    // 创建一个新对象
    BaseCopyObject *copyObject = [[self class] allocWithZone:zone];
    
    // 将当前对象的内容复制到这个新对象
    [self copyOperationWithObject:copyObject];
    
    return copyObject;
}

// 提供一个空实现（交给字类重载）
- (void)copyOperationWithObject:(id)object {
    
}
@end
