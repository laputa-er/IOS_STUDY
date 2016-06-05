//
//  ViewController.m
//  L0803_设计游戏机模拟器
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

#import "GBAImplementor.h"
#import "GBASystem.h"

#import "PSPImplementor.h"
#import "PSPSystem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* GBA系统 ＋ GBA执行器 */
    // 创建GBA系统
    AbstractSystem *gbaSystem = [[GBASystem alloc] init];
    // 设置GBA执行器
    gbaSystem.implementor = [[GBAImplementor alloc] init];
    // 启动系统
    [gbaSystem loadSystem];
    
    
    /* PSP系统 ＋ PSP执行器 */
    // 创建PSP系统
    AbstractSystem *pspSystem = [[PSPSystem alloc] init];
    // 设置PSP执行器
    pspSystem.implementor = [[PSPImplementor alloc] init];
    // 启动系统
    [pspSystem loadSystem];
    
    
}

@end
