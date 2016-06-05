//
//  ViewController.m
//  L04用POP动画引擎实现衰减动画
//
//  Created by TonyEarth on 16/4/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化button
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.button.backgroundColor = [UIColor redColor];
    self.button.layer.cornerRadius = 50;
    self.button.layer.masksToBounds = YES;
    self.button.center = self.view.center;
    
    // 添加到视图
    [self.view addSubview:self.button];
    
    // 注册事件
    [self.button addTarget:self
                    action:@selector(buttonEvent:)
          forControlEvents:UIControlEventTouchUpInside];
    // 初始化手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    // 添加手势
    [self.button addGestureRecognizer:panGesture];
}

/**
 *  点击按钮取消按钮
 *
 *  @param button 按钮控件
 */
- (void)buttonEvent:(UIButton *)button
{
    [button.layer pop_removeAllAnimations];
}

/**
 *  手势操作的响应函数
 *
 *  @param recognizer 事件目标控件
 */
- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // 拖动停止
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        //1. 创建动画
        // 获取加速度
        CGPoint velocity = [recognizer velocityInView:self.view];
        
        // 初始化POP的decay(衰减)动画
        POPDecayAnimation *decayAnimation = \
            [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        // 设置加速度
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        
        //2. 执行动画
        [recognizer.view.layer pop_addAnimation:decayAnimation forKey:nil];
    }
}
@end
