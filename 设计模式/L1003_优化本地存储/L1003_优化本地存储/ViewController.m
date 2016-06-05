//
//  ViewController.m
//  L1003_优化本地存储
//
//  Created by TonyEarth on 16/5/26.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "StoreValue.h"
#import "StudentModel.h"
#import "InfoModel.h"
#import "NSObject+StoreValue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将相对复杂的对象数据存储到用户首选项（借由对象的扩展）
    StudentModel *student = [[StudentModel alloc] init];
    student.name = @"A";
    NSArray *array = @[[InfoModel new], [InfoModel new], [InfoModel new]];
    student.datas = array;
    [student storeValueWithKey:@"FastCoding"];
    
    // 从用户首选项中取出数据
    StudentModel *tmpStudent = [StudentModel valueByKey:@"FastCoding"];
    NSLog(@"%@", tmpStudent.name);
    NSLog(@"%@", tmpStudent.datas);
}

@end
