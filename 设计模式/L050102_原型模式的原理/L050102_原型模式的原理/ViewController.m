//
//  ViewController.m
//  L050102_原型模式的原理
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 学生1
    StudentModel *stu1 = [[StudentModel alloc] init];
    stu1.name = @"mengxiang";
    stu1.age = @(1);
    stu1.address = @"海淀区";
    stu1.totalScore = @(100);
    
    // 学生2
    StudentModel *stu2 = [stu1 clone];// 应用原型模式
    stu2.name = @"Viking";
    stu2.address = @"Northern Europe";
}

@end
