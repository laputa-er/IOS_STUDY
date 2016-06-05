//
//  ViewController.m
//  L03maskView配合 CAGradientLayer的使用
//
//  Created by baidu on 16/4/6.
//  Copyright © 2016年 tonyearth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 底图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 200)];
    imageView.image = [UIImage imageNamed:@"base"];
    [self.view addSubview:imageView];
    
    // 2. mask (使用 CAGradientLayer 替代 png 图片)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = imageView.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations = @[@(0.25), @(0.5), @(0.75)];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);

    UIView *containerView = [[UIView alloc] initWithFrame:imageView.bounds];
    [containerView.layer addSublayer:gradientLayer];
    
    // 3. set maskView
    imageView.maskView = containerView;
    
    // 给 maskView 做动画效果
    [UIView animateWithDuration:3.f animations:^{
        // 新位置
        CGRect frame = containerView.frame;
        frame.origin.x += 400;
        containerView.frame = frame;
    }];
}
@end
