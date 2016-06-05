//
//  ViewController.m
//  L15UIView的CALayer
//
//  Created by TonyEarth on 16/3/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  设置原生控件的CALayer（以 UIImageView 为例）
 */
- (void)initImageView
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imgView.frame = CGRectMake((kScreenWidth - 200) / 2, (kScreenHeight - 200) / 2, 200, 200);// 设置frame
    [self.view addSubview:imgView];// 将 UIImageView 添加到视图中
    
    // 设置 UIImageView 的根 CGLayer
    // 1. 设置阴影
    imgView.layer.shadowColor = [UIColor yellowColor].CGColor;// 设置阴影颜色
    imgView.layer.shadowOffset = CGSizeMake(10, 10);// 设置阴影的偏移
    imgView.layer.shadowOpacity = 0.5;// 设置阴影的不透明
    // 2. 设置圆角
    imgView.layer.cornerRadius = 10;// 设置圆角半径
    imgView.layer.masksToBounds = YES;// 强制内部的所有子层支持圆角效果，少了这个设置，UIImageView是不会有圆角效果的。设置之后，没有阴影效果。
    // 3. 设置边框
    imgView.layer.borderWidth = 5;
    imgView.layer.borderColor = [UIColor grayColor].CGColor;
    // 4. 设置旋转：利用 transform 属性可以设置旋转、缩放等效果
    imgView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);// 顺时针旋转45度
    imgView.layer.transform = CATransform3DMakeScale(0.5, 1, 0);// 缩小0.5倍
    
    // [imgView.layer setValue:@(2) forKey:@"transform.scale.x"];// 使用KVC方式
    
}
@end
