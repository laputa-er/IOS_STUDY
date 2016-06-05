//
//  ViewController.m
//  L0704用CAGradientLayer封装带色差动画的View
//
//  Created by TonyEarth on 16/4/12.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "ColorUIImageView.h"

@interface ViewController ()
@property (nonatomic, strong) ColorUIImageView *colorView;// 渐变图层
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 初始化封装了渐变图层的自定义视图
    self.colorView        = [[ColorUIImageView alloc] initWithFrame:CGRectMake(0, 0, 198, 253)];
    self.colorView.center = self.view.center;
    self.colorView.image  = [UIImage imageNamed:@"bg"];
    
    // 2. 添加到当前视图
    [self.view addSubview:self.colorView];
    
    // 3. 1秒钟后改变视图
    [self performSelector:@selector(event)
               withObject:nil
               afterDelay:1.f];
}

/**
 *  改变渐变颜色组、渐变方向和分割点
 */
- (void)event {
    self.colorView.direction = DOWN;
    self.colorView.color     = [UIColor cyanColor];
    self.colorView.percent   = 0.5;
}

@end
