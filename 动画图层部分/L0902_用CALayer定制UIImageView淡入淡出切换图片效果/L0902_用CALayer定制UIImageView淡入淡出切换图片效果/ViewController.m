//
//  ViewController.m
//  L0902_用CALayer定制UIImageView淡入淡出切换图片效果
//
//  Created by TonyEarth on 16/4/13.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "FadeUIView.h"

@interface ViewController ()
@property (nonatomic, strong)FadeUIView *fadeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 初始化呈现动画的视图
    self.fadeView = [[FadeUIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.fadeView];
    
    // 设置第一张图片
    self.fadeView.image = [UIImage imageNamed:@"起始图片"];
    
    // 2秒钟后设置下一张图片
    [self performSelector:@selector(layerAnimation)
               withObject:nil
               afterDelay:3.f];
}

/**
 *  设置下一张图片
 */
- (void)layerAnimation
{
    self.fadeView.image = [UIImage imageNamed:@"结束图片"];
}
@end
