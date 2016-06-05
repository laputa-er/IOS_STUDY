//
//  ViewController.m
//  L15动画基础
//
//  Created by TonyEarth on 16/3/31.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *animView;

- (IBAction)exchangeView;
- (IBAction)pushAction;

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


#pragma mark - 转场动画
- (IBAction)exchangeView {
    // 1. 创建转场动画对象
    CATransition *animation = [CATransition animation];
    
    // 2. 设置转场动画
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = @"pageCurl";// 翻页效果：私有API的动画类型
    animation.subtype = kCATransitionFromRight;// 翻页方向
    
    // 3. 实施动画
    [_animView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [_animView.layer addAnimation:animation forKey:@"myAnimation"];
    
}

- (IBAction)pushAction {
    // 1. 创建转场动画对象
    CATransition *animation = [CATransition animation];
    
    // 2. 设置转场动画
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = @"cube";// 立体翻转
    
    // 3. 将动画添加到导航控制器视图图层
    [self.navigationController.view.layer addAnimation:animation forKey:@"navAnimation"];
    // 4. 实施动画
    DetailViewController *detailVC = [[DetailViewController alloc] init];// 创建要导航到的视图控制器
    [self.navigationController showViewController:detailVC sender:nil];// 导航到目标视图控制器
}
@end
