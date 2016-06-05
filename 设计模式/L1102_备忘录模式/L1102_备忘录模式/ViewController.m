//
//  ViewController.m
//  L1102_备忘录模式
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Apple.h"
#import "MementoCenter.h"
#import "NSObject+MementoCenter.h"
#import "DemoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 创建对象
    Apple *apple = [[Apple alloc] init];
    apple.name = @"laputa-er";
    apple.age = @(30);
    
    // 存储此时的状态
    [apple saveStateWithKey:@"birth"];
    
    // 恢复到指定的状态
    [apple recoverFromStateWithKey:@"birth"];
    
    NSLog(@"name:%@ age:%@", apple.name, apple.age);
}

- (void)demoForUIView {
    // 创建 UIView
    DemoView *demoView = [[DemoView alloc] init];
    demoView.frame = CGRectMake(100, 100, 100, 100);

    // 存储此时的状态
    [demoView saveStateWithKey:@"A"];
    
    // 恢复状态
    [demoView recoverFromStateWithKey:@"A"];
    
    NSLog(@"%@", demoView);
}
@end
