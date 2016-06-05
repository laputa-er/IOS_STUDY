//
//  ViewController.m
//  0903_用CALayer实现复杂遮罩效果
//
//  Created by TonyEarth on 16/4/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    UIImage *imageForContents = [UIImage imageNamed:@"原始图片"];// 底图
    UIImage *imageForMask = [UIImage imageNamed:@"maskLayerContents"];// 作为遮罩的图片
    
    // 图片 layer
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = CGRectMake(50, 50, 200, 200);
    self.imageLayer.contents = (__bridge id)(imageForContents.CGImage);
    [self.view.layer addSublayer:self.imageLayer];
    
    // 遮罩 layer
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = CGRectMake(0, 0, 100, 100);
    self.maskLayer.contents = (__bridge id)(imageForMask.CGImage);
    // self.maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    
    // 给图片 layer 提供遮罩的 layer
    self.imageLayer.mask = self.maskLayer;
    
    // 3秒中中后做 maskLayer 动画
    [self performSelector:@selector(maskLayerAnimation)
               withObject:nil
               afterDelay:3.f];
}

- (void)maskLayerAnimation
{
    self.maskLayer.frame = CGRectMake(50, 50, 100, 100);
}
@end
