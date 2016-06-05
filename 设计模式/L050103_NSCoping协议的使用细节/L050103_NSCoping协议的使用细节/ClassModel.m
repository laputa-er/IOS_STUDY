//
//  ClassModel.m
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

- (void)copyOperationWithObject:(ClassModel *)object {
    object.className = self.className;
    
    // 完成了深拷贝(完整的复制了集合里面的对象)
    object.students = [[NSArray alloc] initWithArray:self.students copyItems:YES];
}

@end
