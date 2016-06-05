//
//  ViewController.m
//  L1002_编写严格的单例
//
//  Created by TonyEarth on 16/5/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoManagerCenter.h"
#import "NewManagerCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    /* 正确获取单例的方法 */
    UserInfoManagerCenter *center = [UserInfoManagerCenter managerCenter];
    
    /* 无效的方式:会引起程序崩溃 */
    NSLog(@"%@", [NewManagerCenter managerCenter]);// 试图创建子类实例
    NSLog(@"%@", [[UserInfoManagerCenter alloc] init]);// 试图直接调用构造器
}

@end
