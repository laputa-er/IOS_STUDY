//
//  ViewController.m
//  L14手势密码锁示例
//
//  Created by TonyEarth on 16/3/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "JKLockView.h"
@interface ViewController ()<JKLockViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 采纳JKLockViewDelegate
- (void)lockView:(JKLockView *)lockView didFinishPath:(NSString *)path
{
    // 解锁成功
    if ([path isEqualToString:@"012345678"]) {
        // 创建 UIAlertController 实例
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码正确" message:nil preferredStyle:UIAlertControllerStyleAlert];
        // 设置 UIAlertController 实例
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];// 确定按钮
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];// 取消按钮
        // 展现该视图控制器
        [self presentViewController:alert animated:YES completion:nil];
    }
    // 解锁失败
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码错误" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];// 确定按钮
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];// 取消按钮
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
