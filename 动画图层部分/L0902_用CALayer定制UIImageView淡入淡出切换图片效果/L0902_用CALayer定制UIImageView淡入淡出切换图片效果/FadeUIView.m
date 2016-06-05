//
//  FadeUIView.m
//  L0902_用CALayer定制UIImageView淡入淡出切换图片效果
//
//  Created by TonyEarth on 16/4/13.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "FadeUIView.h"

@implementation FadeUIView

// 重写 setter, getter
@synthesize image = _image;
- (void)setImage:(UIImage *)image
{
    _image = image;
    // 除了第一次设置图片，都加入淡如淡出的效果
    if (self.layer.contents != nil) {
        // 创建淡入/淡出的切换动画
        CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
        contentsAnimation.fromValue = self.layer.contents;
        contentsAnimation.toValue = (__bridge id)(image.CGImage);
        contentsAnimation.duration = 3.f;
        
        // 将动画添加到图层
        [self.layer addAnimation:contentsAnimation forKey:nil];
    }
    // 修改 contents，触发动画
    self.layer.contents = (__bridge id)(image.CGImage);
}

- (UIImage *)image
{
    return _image;
}
@end
