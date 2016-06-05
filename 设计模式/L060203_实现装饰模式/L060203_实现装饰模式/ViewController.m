//
//  ViewController.m
//  L060203_实现装饰模式
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "GamePad.h"
#import "GamePadDecorator.h"
#import "CheatGamePadDecorator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 原始类
    GamePad *gamePad = [[GamePad alloc] init];
    [gamePad up];
    
    
    // 开外挂的遥控器
    CheatGamePadDecorator *cheatGamePad = [[CheatGamePadDecorator alloc] init];
    [cheatGamePad cheat];// 调用扩展的方法
}

@end
