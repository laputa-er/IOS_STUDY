//
//  ViewController.m
//  L04用POP动画引擎实现弹簧动画
//
//  Created by TonyEarth on 16/4/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>

@interface ViewController ()
@property (nonatomic, strong) UIView *showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置背景色
    self.view.backgroundColor = [UIColor blackColor];
    
    // 初始化view
    self.showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.showView.backgroundColor = [UIColor cyanColor];
    self.showView.center = self.view.center;
    [self.view addSubview:self.showView];
    
    // 延时3秒执行动画
    [self performSelector:@selector(startSpringAnimation)
               withObject:nil
               afterDelay:3.f];
}

/**
 *  示例弹簧动画
 */
- (void)startSpringAnimation
{
    // 初始化spring动画
    POPSpringAnimation *sizeAnimation = \
    [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];// 缩放型动画
    sizeAnimation.springSpeed = 0.f;
    sizeAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    
    // 添加动画
    [self.showView pop_addAnimation:sizeAnimation forKey:nil];

}
@end
