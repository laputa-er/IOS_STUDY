//
//  ViewController.m
//  L0603封装下雪、下雨的粒子效果控件
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "CAEmitterLayerView.h"
#import "SnowView.h"
#import "RainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 初始化粒子效果图层
    // 下雪效果图层
    CAEmitterLayerView *snowView = [[SnowView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    // 下雨效果图层
    CAEmitterLayerView *rainView = [[RainView alloc] initWithFrame:CGRectMake(100, 210, 100, 100)];
    [self.view addSubview:snowView];
    
    // 2. 模糊化粒子视图边界
    UIImageView *alphaView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    alphaView1.image = [UIImage imageNamed:@"alpha"];
    UIImageView *alphaView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    alphaView2.image = [UIImage imageNamed:@"alpha"];

    snowView.maskView = alphaView1;
    rainView.maskView = alphaView2;
    
    // 3. 添加到当前图层
    [self.view addSubview:snowView];
    [self.view addSubview:rainView];
    
    // 4. 展现
    [snowView show];
    [rainView show];
    
}

@end
