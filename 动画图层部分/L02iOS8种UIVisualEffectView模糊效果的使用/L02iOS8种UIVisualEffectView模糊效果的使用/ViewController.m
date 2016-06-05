//
//  ViewController.m
//  L02iOS8种UIVisualEffectView模糊效果的使用
//
//  Created by TonyEarth on 16/4/4.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*--- 1. 环境 ----*/
    // 1.1 图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"normal"]];

    // 1.2 展示视图（UIScrollView）：用以显示动态模糊
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = imageView.image.size;// 展现视图和图片大小一致
    self.scrollView.bounces = NO;// 无边缘反弹效果
    
    // 1.3 将图片添加到展示视图
    [self.scrollView addSubview:imageView];
    // 1.4 将展示视图添加到当前视图
    [self.view addSubview:self.scrollView];
    
    /*--- 2. 添加模糊视图 ---*/
    // 2.1 创建模糊 view
    UIVisualEffectView *effecView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    // 2.2 设置尺寸（动态模糊区域）
    effecView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 200);
    // 2.3 添加到 view
    [self.view addSubview:effecView];
    /*------ 3. 子模糊视图（文本） ------*/
    // 3.1  添加显示文本
    UILabel *label = [[UILabel alloc] initWithFrame:effecView.bounds];
    label.text = @"时代精神";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:50.f];
    label.textAlignment = NSTextAlignmentCenter;
    // 3.2  创建子模糊 view
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effecView.effect]];
    // 3.3  尺寸
    subEffectView.frame = effecView.bounds;
    
    // 3.4  将子模糊view添加到effectView的contentView才能够生效
    [effecView.contentView addSubview:subEffectView];
    
    // 3.5  添加文本（此时文本会个模糊视图融合得比较好）
    [subEffectView.contentView addSubview:label];
    
    
}

@end
