//
//  ViewController.m
//  L15自定义图层-方式1-继承CALayer
//
//  Created by TonyEarth on 16/3/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "MyCALyer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myLayerExample];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  示例自定义 CALayer 的使用
 */
- (void)myLayerExample
{
    // 创建自定义 layer 实例
    MyCALyer *layer = [MyCALyer layer];
    // 设置该 layer 实例
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.delegate = self;
    // 绘制该layer
    [layer setNeedsDisplay];// 调用该方法，layer 的 drawInContext 方法才会被调用
    // 添加到视图中
    [self.view.layer addSublayer:layer];// 添加到视图
}
@end
