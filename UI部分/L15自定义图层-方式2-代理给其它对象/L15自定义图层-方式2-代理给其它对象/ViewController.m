//
//  ViewController.m
//  L15自定义图层-方式2-代理给其它对象
//
//  Created by baidu on 16/3/31.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "JKLayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JKLayer *layer = [JKLayer layer];
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.delegate = self;// 不用采纳额外协议，任何对象可以作为代理对象
    [layer setNeedsDisplay];// 必须调用这个方法，layer 才会显示
    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 代理方法
/**
 *  @override
 *  修改当前ViewController的根Layer
 *  @param layer 图层
 *  @param ctx   绘制上下文
 */
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    // 设置图层
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextAddEllipseInRect(ctx, CGRectMake(10,10, 100, 100));
    CGContextFillPath(ctx);
}
@end
