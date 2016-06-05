//
//  ViewController.m
//  L1001_单例模式
//
//  Created by TonyEarth on 16/5/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoManagerCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 获取单例实例
    UserInfoManagerCenter *center = [UserInfoManagerCenter managerCenter];
    
    // 在实例中设置信息
    center.name = @"Dave";
    center.age = [NSNumber numberWithInteger:50];
    
    NSLog(@"%@", center.name);
}


@end
