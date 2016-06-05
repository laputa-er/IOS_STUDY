//
//  ViewController.m
//  L0901_用CALayer定制下载进度条控件
//
//  Created by baidu on 16/4/13.
//  Copyright © 2016年 tonyearth. All rights reserved.
//

#import "ViewController.h"
#import "ProgressUIView.h"

@interface ViewController ()
@property (nonatomic, strong) ProgressUIView *progressView;// 进度条控件
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 初始化进度条控件
    self.progressView = [[ProgressUIView alloc] initWithFrame:CGRectMake(20, 20, 290, 3)];
    self.progressView.layerColor = [UIColor yellowColor];
    [self.view addSubview:self.progressView];
    
    // 定时器（1秒改变以一次进度）
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(layerAnimation)
                                                userInfo:nil
                                                 repeats:YES];
}

/**
 *  给进度一个随机的值
 */
- (void)layerAnimation
{
    // 随机获取0% ~ 100% 给layer 赋值
    self.progressView.progress = arc4random() % 100 / 100.f;
}
@end
