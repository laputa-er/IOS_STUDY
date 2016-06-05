//
//  ViewController.m
//  L0704_Cocoa 框架中的 NSNumber
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 由于NSNumber是一个抽象工厂，这里只会返回一个 nil
    NSLog(@"%@", [[NSNumber alloc] init]);
    
    // 创建具体的工厂实例
    NSNumber *number = [NSNumber numberWithInt:100];// 通过Int类型的100获取一个工厂实例
    NSNumber *floatValue = [NSNumber numberWithFloat:100.f];// 通过浮点数100.f获取一个工厂实例
    
    // 使用工厂实例生产具体的产品（具体类型的数字）
    NSLog(@"%c", [number charValue]);
    NSLog(@"%c", [floatValue charValue]);
}

@end
