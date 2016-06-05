//
//  ViewController.m
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"
#import "ClassModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 学生1
    StudentModel *stu1 = [[StudentModel alloc] init];
    stu1.name = @"Rick";
    
    // 学生2
    StudentModel *stu2 = stu1.copy;// 浅拷贝
    
    // 班级1
    ClassModel *class1 = [[ClassModel alloc] init];
    class1.className = @"一班";
    class1.students = @[stu1, stu2];
    
    // 班级2
    ClassModel *class2 = class1.copy;// 深拷贝
    NSLog(@"%@ %@", class1, class2);
    NSLog(@"%@", class1.students);
    NSLog(@"%@", class2.students);
}

@end
