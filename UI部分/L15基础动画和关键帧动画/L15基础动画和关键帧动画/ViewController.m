//
//  ViewController.m
//  L15基础动画和关键帧动画
//
//  Created by TonyEarth on 16/4/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;// 用于演示动画的图层

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 创建图层
    CALayer *layer = [CALayer layer];
    // 设置图层
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    // 添加图层
    [self.view.layer addSublayer:layer];
    self.layer = layer;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // [self animationScale];
    // [self animationTranslate];
    // [self animationRotation];
    [self keyFrameAnimation];
}

#pragma mark - 基本动画(CABasicAnimation)
// 缩放
- (void)animationScale
{
    // 1. 创建动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    // 2. 设置 动画
    // keyPath ：决定了基本动画的类型
    animation.keyPath = @"bounds";
    // toValue 到达哪个点，byValue 增加多少值, fromValue 从哪个点开始移动
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];// toValue ：到达哪个点
    animation.duration = 2;// 动画持续时间
    animation.removedOnCompletion = NO;// 动画完毕之后不删除动画（即，可以再次触发）
    animation.fillMode = @"forwords";
    
    // 3. 添加动画到图层
    [self.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 平移
- (void)animationTranslate
{
    // 1. 创建动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    // 2. 设置动画
    animation.keyPath = @"position";
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forwards";
    
    // 3. 添加动画
    [self.layer addAnimation:animation forKey:nil];
}

// 旋转
- (void)animationRotation
{
    // 1. 创建动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    // 2. 设置动画
    animation.keyPath = @"transform";
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 1, 1, 0)];
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forward";
    
    // 3. 添加动画
    [self.layer addAnimation:animation forKey:nil];
}

#pragma mark - 关键帧动画
// 让图层做一个圆形移动
- (void)keyFrameAnimation
{
    // 1. 创建动画对象
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 2. 设置动画
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;// 保持最新的状态
    animation.duration = 2;
    
    CGMutablePathRef path = CGPathCreateMutable();// 创建一个可变路径
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));// 画一个圆
    animation.path = path;// 设置动画路径
    // CGPathRelease(path);
    
    // 3. 设置动画的执行节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;// 也可以将动画设置工作交给代理对象
    
    //4. 添加动画
    [self.layer addAnimation:animation forKey:nil];
}

#pragma mark - 组动画
// 组动画
- (void)animationGroup
{
    // 1. 创建组动画对象
    // CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    // 2. 创建多个动画，添加到组动画（数组）中
    // animationGroup.animations = @[];
    
    // 3. 添加动画
    // [self.layer addAnimation:animationGroup forKey:nil];
}
@end
