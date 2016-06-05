//
//  PushViewController.m
//  L11三级控制器
//
//  Created by TonyEarth on 16/3/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    // 创建回退（pop）按钮
    UIButton *popButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    popButton.frame = CGRectMake(100, 100, 200, 40);
    // 设置文本（使用了setTitle就不能setImage了）
    [popButton setTitle:@"Pop" forState:UIControlStateNormal];
    // 注册事件
    [popButton addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popButton];
}

/**
 *  回退(pop)到堆栈中的上一个视图(首页)
 */
- (void)popAction
{
    [self.navigationController popViewControllerAnimated:YES];
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
