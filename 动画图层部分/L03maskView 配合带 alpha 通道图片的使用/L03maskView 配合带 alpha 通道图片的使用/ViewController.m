//
//  ViewController.m
//  L03maskView 配合带 alpha 通道图片的使用
//
//  Created by TonyEarth on 16/4/6.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 遮罩图片1
    UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 400)];
    picOne.image = [UIImage imageNamed:@"1"];
    
    // 遮罩图片2
    UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(100, -200, 100, 400)];
    
    picTwo.image = [UIImage imageNamed:@"2"];
    
    // 原始背景图
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    backgroundView.image = [UIImage imageNamed:@"background"];
    backgroundView.center = self.view.center;
    
    // 待切换目标背景图
    UIImageView *baseView = [[UIImageView alloc] initWithFrame:backgroundView.frame];
    baseView.image = [UIImage imageNamed:@"base"];
    
    // 为带切换图 set maskView
    UIView *mask = [[UIImageView alloc] initWithFrame:baseView.bounds];
    // 两个png图片合成新遮罩
    [mask addSubview:picOne];
    [mask addSubview:picTwo];
    baseView.maskView = mask;
    

    [self.view addSubview:backgroundView];
    [self.view addSubview:baseView];
    
    // 动画
    [UIView animateWithDuration:2.f animations:^{
        // 偏移左半边的遮罩
        CGRect oneFrame = picOne.frame;
        oneFrame.origin.y -= 400;
        picOne.frame = oneFrame;
        
        // 偏移右半边遮罩
        CGRect twoFrame = picTwo.frame;
        twoFrame.origin.y += 400;
        picTwo.frame = twoFrame;
    }];
}

@end
