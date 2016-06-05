//
//  ViewController.m
//  L0505用缓动函数模拟衰减效果
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
 
    // 动画1:背景变暗
    UIView  *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor blackColor];
    [UIView animateWithDuration:1.f animations:^{
        backView.alpha = 0.3;
    }];
    [self.view addSubview:backView];
    
    // 动画2:衰减滑出
    // 创建图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 568)];
    imageView.image = [UIImage imageNamed:@"pic"];
    [self.view addSubview:imageView];
    
    // 创建关键帧动画
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    keyFrameAnimation.duration = 1.f;
    keyFrameAnimation.values = \
        [YXEasing calculateFrameFromPoint:imageView.center
                                  toPoint:CGPointMake(self.view.center.x + 100, self.view.center.y)
                                     func:CubicEaseOut
                               frameCount:1 * 30];
    // 添加动画
    imageView.center = CGPointMake(self.view.center.x + 100, self.view.center.y);
    [imageView.layer addAnimation:keyFrameAnimation forKey:nil];
}

@end
