//
//  ViewController.m
//  L02UIImage+ImageEffects的category模糊效果
//
//  Created by TonyEarth on 16/4/4.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 原始图片
    UIImage *sourceImage = [UIImage imageNamed:@"normal"];
    
    // 对图片进行模糊
    UIImage *blurImage = [sourceImage blurImageAtFrame:CGRectMake(0, 100, sourceImage.size.width, sourceImage.size.height / 2.f)];
    
    // 加载图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:blurImage];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    // 添加到当前视图
    [self.view addSubview:imageView];
}

@end
