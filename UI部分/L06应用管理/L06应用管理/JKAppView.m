//
//  JKAppView.m
//  L06应用管理
//
//  Created by TonyEarth on 16/3/1.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "JKAppView.h"
#import "JKAppInfo.h"
//------ 扩展
@interface JKAppView ()

@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end

//------- 实现
@implementation JKAppView
- (IBAction)downloadBtnOnClick:(UIButton *)sender {
    // 调用代理对象的”点击下载按钮“的响应函数
    if ([self.delegate respondsToSelector:@selector(downloadClickWithBtn:)]) {
        [self.delegate downloadClickWithBtn:sender];
    }
}

// 工厂构造
+ (instancetype)appView
{
    // 从指定nib文件中获取目标View控件（是唯一的，所以可以用lastObject）
    return [[[NSBundle mainBundle]loadNibNamed:@"JKAppView" owner:nil options:nil] lastObject];
}

// 为View控件初始化内部信息
- (void)setAppInfo:(JKAppInfo *)appInfo
{
    _appInfo = appInfo;
    self.iconView.image = appInfo.image;
    self.nameLabel.text = appInfo.name;
}
@end
