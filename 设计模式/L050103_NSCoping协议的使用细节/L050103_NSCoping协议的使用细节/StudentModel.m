//
//  StudentModel.m
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (void)copyOperationWithObject:(StudentModel *)object {
    object.name = self.name;
    object.age = self.age;
}

@end
