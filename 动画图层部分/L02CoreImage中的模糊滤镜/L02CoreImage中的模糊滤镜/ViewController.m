//
//  ViewController.m
//  L02CoreImage中的模糊滤镜
//
//  Created by TonyEarth on 16/4/4.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 原始图片
    UIImage *image = [UIImage imageNamed:@"sourceImage"];
    
    // 2. coreImage部分
    /*------- coreImage 部分 ------*/
    
    // CIImage - 将 UIImage 包装为 CIImage 才可以用于滤镜
    CIImage *ciImage = [[CIImage alloc]initWithImage:image];
    
    // CIFilter － 滤镜
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    
    // 查看滤镜可以设置的参数以及一些相关的信息
    NSLog(@"%@", [blurFilter attributes]);
    
    // 将图片输入到滤镜中
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];//  KVC方式
    
    // 设置模糊程度(0-100)
    [blurFilter setValue:@(3) forKey:@"inputRadius"];
    
    // 将处理好的图片输出为 CIImage
    CIImage *outCiImage = [blurFilter valueForKey:kCIOutputImageKey];
    
    // CIContext
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // 获取 CGImage 句柄
    CGImageRef outCGImage = [context createCGImage:outCiImage fromRect:[outCiImage extent]];
    
    // 最终获取的图片
    UIImage *blurImage = [UIImage imageWithCGImage:outCGImage];
    
    // 释放 CGImage 句柄
    CGImageRelease(outCGImage);
    /*-----------------------------*/
    
    // 3. 初始化UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 590 / 2.f, 988 / 2.f)];
    imageView.image = blurImage;
    imageView.center = self.view.center;
    
    // 4. 添加到当前视图
    [self.view addSubview:imageView];
}

@end
