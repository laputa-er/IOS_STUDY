//
//  ViewController.m
//  L02设计下载图片后自动模糊的控件
//
//  Created by TonyEarth on 16/4/5.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "BlurDownloadPicView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *picUrlString = @"http://img.zcool.cn/community/0207a4570363fc6ac7257948ec0f00.jpg@800w_1l_2o";// 下载地址
    
    // 创建模糊视图
    BlurDownloadPicView *blurDownloadView = [[BlurDownloadPicView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    blurDownloadView.center = self.view.center;
    blurDownloadView.pictureUrlString = picUrlString;
    blurDownloadView.contentMode = UIViewContentModeScaleAspectFill;
    // 添加到视图
    [self.view addSubview:blurDownloadView];
    // 下载图片 模糊图片 呈现
    [blurDownloadView startProgress];
}

@end
