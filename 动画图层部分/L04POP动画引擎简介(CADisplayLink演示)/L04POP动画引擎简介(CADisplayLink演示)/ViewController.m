//
//  ViewController.m
//  L04POP动画引擎简介(CADisplayLink演示)
//
//  Created by TonyEarth on 16/4/7.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建 displayLink
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkEvent:)];
    // 1秒钟后开始刷新
    [self performSelector:@selector(eventOne) withObject:nil afterDelay:1];
    // 2秒中后停止刷新
    [self performSelector:@selector(eventTwo) withObject:nil afterDelay:2];
}

/**
 *  每次刷新调用该方法
 *
 *  @param object 对象
 */
- (void)displayLinkEvent:(id)object
{
    self.count ++;
    NSLog(@"count = %ld", (long)self.count);
}

/**
 *  开始刷新
 */
- (void)eventOne
{
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

/**
 *  停止刷新
 */
- (void)eventTwo
{
    [self.displayLink invalidate];
}
@end
