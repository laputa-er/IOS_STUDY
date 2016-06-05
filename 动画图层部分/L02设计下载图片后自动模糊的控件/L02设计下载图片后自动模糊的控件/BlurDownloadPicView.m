//
//  BlurDownloadPicView.m
//  L02设计下载图片后自动模糊的控件
//
//  Created by TonyEarth on 16/4/5.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BlurDownloadPicView.h"
#import "GCD.h"
#import "UIImage+ImageEffects.h"

@interface BlurDownloadPicView ()

@property (nonatomic, strong) UIImageView *imageView;

@end
@implementation BlurDownloadPicView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化控件
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.alpha = 0.f;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)startProgress
{
    if (self.pictureUrlString) {
        
        
        // 在子线程中执行下载图片的过程
        [GCDQueue executeInGlobalQueue:^{
            // 创建请求
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.pictureUrlString]];
            // 获取数据(因为是同步请求，会阻塞主线程)
            NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:nil
                                                             error:nil];
            UIImage *image = [[UIImage alloc] initWithData:data];
            
            UIImage *blurImage = [image blurImage];
            
            [GCDQueue executeInMainQueue:^{
                // 在主线程中加载图片
                self.imageView.image = blurImage;
                // 动画效果：淡出
                [UIView animateWithDuration:1.f animations:^{
                    self.imageView.alpha = 1.f;
                }];
            }];
        }];
    }
}

@synthesize contentMode = _contentMode;
- (void)setContentMode:(UIViewContentMode)contentMode {
    _contentMode = contentMode;
    self.imageView.contentMode = contentMode;
}
- (UIViewContentMode)contentMode {
    return _contentMode;
}
@end
