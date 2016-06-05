//
//  RootViewController.m
//  L11三级控制器
//
//  Created by TonyEarth on 16/3/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "RootViewController.h"
#import "ProfileViewController.h"
#import "MessageViewController.h"
#import "ColaViewController.h"
#import "UserViewController.h"
#import "MoreViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

CGFloat const tabViewHeight = 49;// 标签工具栏高度
CGFloat const btnWidth = 64;// 标签工具栏中按钮的宽度
CGFloat const btnHeight = 45;// 标签工具栏中按钮的高度

@interface RootViewController ()

@property (nonatomic, strong) UIImageView *selectView;//

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;// 隐藏 UITabViewController 自带的tab bar
    [self initViewController];
    [self initTabBarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 初始化所有第二级控制器
- (void)initViewController
{
    // 初始化视图控制器
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    ColaViewController *colaVC = [[ColaViewController alloc]init];
    UserViewController *userVC = [[UserViewController alloc]init];
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    // 封装到数组中
    NSArray *vcArr = @[profileVC, messageVC, colaVC, userVC, moreVC];
    NSMutableArray *tabArray = [NSMutableArray arrayWithCapacity:vcArr.count];
    // 为每个视图控制器创建对应的导航控制器
    for (int i = 0; i < vcArr.count; i++) {
        UINavigationController *navCtrl = [[UINavigationController alloc]initWithRootViewController:vcArr[i]];// 创建导航视图器时为其绑定对应的视图控制器
        [tabArray addObject:navCtrl];
    }
    // 将初始化好的存储导航控制器的数组作为一个属性赋值给第一级控制器
    self.viewControllers = tabArray;
}
// 初始化标签工具栏
- (void)initTabBarView
{
    // 初始化 标签工具栏视图
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - tabViewHeight, kScreenWidth, tabViewHeight)];
    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask_navbar"]];
    [self.view addSubview:_tabBarView];
    // 初始化 标签工具栏视图 中的按钮
    NSArray *imgArray = @[@"home_tab_icon_1", @"home_tab_icon_2", @"home_tab_icon_3", @"home_tab_icon_4", @"home_tab_icon_5"];
    for (int i; i < imgArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
        btn.frame = CGRectMake(btnWidth * i, (tabViewHeight - btnHeight) / 2, btnWidth, btnHeight);
        btn.tag = 100 + i;// 用来识别点击哪些按钮进行的tab切换（100以内的tag有特殊用途）
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView addSubview:btn];
    }
    // 初始化当前被选中的tab按钮上展现的视图（倒三角）
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    _selectView.image = [UIImage imageNamed:@"home_bottom_tab_arrow"];
    [_tabBarView addSubview:_selectView];
}
#pragma mark - tab按钮被点击时的处理函数
- (void)btnAction:(UIButton *)button
{
    // 切换视图（根据tag值获取当前索引）
    self.selectedIndex = button.tag - 100;
    // 将倒三角移动到被选中的tab按钮上，移动动画持续时间为0.2秒
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = button.center;
    } completion:nil];
}

/**
 *  显示／隐藏tab工具栏
 *
 *  @param show YES: 显示, NO: 隐藏
 */
- (void)showTabBar:(BOOL)show
{
    CGRect frame = self.tabBarView.frame;
    // 更新frame
    if (show) {
        frame.origin.x = 0;
    }
    else {
        frame.origin.x = -kScreenWidth;// 隐藏tab bar：将tab bar移除屏幕
    }
    // 重新赋值tabBarView的frame
    [UIView animateWithDuration:0.2 animations:^{
        self.tabBarView.frame = frame;
    } completion:nil];
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
