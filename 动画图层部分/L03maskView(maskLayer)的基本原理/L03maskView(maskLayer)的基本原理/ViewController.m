//
//  ViewController.m
//  L03maskView(maskLayer)的基本原理
//
//  Created by TonyEarth on 16/4/6.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *baseImageView;
@property (nonatomic, strong) UIImageView *maskImageView;
@property (nonatomic, strong) UIImageView *addImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat width = 120;
    // 情形1. 只有底图的情形
    self.baseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, width, width)];
    self.baseImageView.image = [UIImage imageNamed:@"base"];
    
    // 情形2. 只有mask（png图片）
    self.maskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20 + width + 20, width, width)];
    self.maskImageView.image = [UIImage imageNamed:@"mask"];
    
    // 情形3. 底图通过maskView组合mask
    // 底图
    self.addImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20 + (width + 20) * 2, width, width)];
    self.addImageView.image = [UIImage imageNamed:@"base"];

    // mask
    UIImageView *mask = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    mask.image = [UIImage imageNamed:@"mask"];
    // 在底图上设置maskView
    self.addImageView.maskView = mask;
    
    [self.view addSubview:self.baseImageView];
    [self.view addSubview:self.maskImageView];
    [self.view addSubview:self.addImageView];
}

@end
