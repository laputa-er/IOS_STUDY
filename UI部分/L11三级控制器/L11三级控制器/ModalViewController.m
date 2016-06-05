//
//  ModalViewController.m
//  L11三级控制器
//
//  Created by TonyEarth on 16/3/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    // 创建回退（dismisss）按钮
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    dismissButton.frame = CGRectMake(100, 100, 200, 40);
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    // 注册点击事件
    [dismissButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    // 添加到视图中
    [self.view addSubview:dismissButton];
}

// 回退页面
- (void)dismissAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
