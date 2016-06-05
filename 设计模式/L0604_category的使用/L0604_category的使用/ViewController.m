//
//  ViewController.m
//  L0604_category的使用
//
//  Created by TonyEarth on 16/5/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "GamePad.h"
#import "GamePad+Coin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    GamePad *gamePad = [[GamePad alloc] init];
    [gamePad up];
    
    gamePad.coin = 10;
    NSLog(@"coin %ld", (long)gamePad.coin);
}


@end
