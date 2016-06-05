//
//  ViewController.m
//  L01用里氏代换原则来处理动画类的继承问题
//
//  Created by TonyEarth on 16/4/3.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "SubUIView1.h"
#import "SubUIView2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 演示类的多态性
    SuperUIView *tmpView = [[SubUIView1 alloc]init];
    [tmpView show];
    [tmpView hide];
    
    tmpView = [[SubUIView2 alloc] init];
    [tmpView show];
    [tmpView hide];
}

@end
