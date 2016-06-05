//
//  ViewController.m
//  L0504用缓动函数模拟碰撞效果
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "YXEasing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 创建图 view
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    imageView.image = [UIImage imageNamed:@"pic"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    // 创建关键帧动画（移动距离的动画）
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    keyFrameAnimation.duration = 2.f;
    keyFrameAnimation.values = \
        [YXEasing calculateFrameFromPoint:imageView.center
                                  toPoint:CGPointMake(320 / 2.f, 320 / 2.f + 240)
                                     func:BounceEaseOut// 碰撞动画
                               frameCount:2 * 30];
    
    // 添加动画
    imageView.center = CGPointMake(320 / 2.f, 320 / 2.f + 240);
    [imageView.layer addAnimation:keyFrameAnimation
                           forKey:nil];
}

@end
