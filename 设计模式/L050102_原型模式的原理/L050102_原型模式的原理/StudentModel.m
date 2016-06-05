//
//  StudentModel.m
//  L050102_原型模式的原理
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (id)clone {
    // 创建一个新的实例
    StudentModel *student = [[[self class] alloc] init];
    // 按照当前实例初始化新的实例
    student.name = self.name;
    student.age = self.age;
    student.address = self.address;
    student.totalScore = self.totalScore;
    
    return student;
}

@end
