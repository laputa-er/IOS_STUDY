//
//  ProfileViewController.m
//  L11三级控制器
//
//  Created by TonyEarth on 16/3/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ProfileViewController.h"
#import "ModalViewController.h"
#import "PushViewController.h"
#import "RootViewController.h"

CGFloat const writeButtonWidth = 33;// 导航栏按钮宽度
CGFloat const writeButtonHeight = 32;// 导航栏按钮高度

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor yellowColor];
    [self initNavButton];
    [self initPushButton];
}

// 自定义导航栏按钮
- (void)initNavButton
{
    // 创建 UIButton
    UIButton *writeBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, writeButtonWidth, writeButtonHeight);
    [writeBtn setBackgroundImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    // 封装为 UIBarButtonItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:writeBtn];
    // 添加到导航栏
    self.navigationItem.rightBarButtonItem = item;
}

/**
 *  初始化 push 页面的按钮
 */
- (void)initPushButton
{
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushButton.frame = CGRectMake(100, 100, 200, 40);
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
}
/**
 *  使用push的方式展现新视图
 */
- (void)pushAction
{
    PushViewController *pushVC = [[PushViewController alloc] init];
    // 通过和当前的视图控制器绑定的导航控制器完成页面的 push
    [self.navigationController pushViewController:pushVC animated:YES];
    // 隐藏首页的tab bar
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:NO];
}

/**
 *  使用模态的方式展现新视图
 */
- (void)presentAction
{
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    // 使用模态视图
    [self presentViewController:modalVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    // 展现首页前显示tab bar
    [super viewWillAppear:animated];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:YES];
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
