//
//  ViewController.m
//  L14手势密码锁
//
//  Created by TonyEarth on 16/3/26.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *genstureLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 注册各种类型的手势事件注册
    [self tapGesture];
    [self swipeGesture];
    [self pinchGesture];
    [self panGesture];
    [self rotationGesture];
    [self longPressGesture];
    // 打开Label的用户交互
    _genstureLabel.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tap 点击和手势
/**
 *  1. 点击示例
 */
- (void)tapGesture
{
    // 类型一：一个手指单击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    tap.numberOfTapsRequired = 1;// 点击次数(默认1)
    tap.numberOfTouchesRequired = 1;// 几个手指点击（默认1）
    [self.view addGestureRecognizer:tap];// 注册事件到顶层view
    
    // 类型二：一个手指双击
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    tap2.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap2];
    
    // 类型一和类型二冲突策略
    [tap requireGestureRecognizerToFail:tap2];// 同时发生时，只触发tap2
    
    // 类型三：两个手指单击
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTwoFingerTap:)];
    tap3.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:tap3];
    
    // 类型二和类型三冲突策略
    [tap2 requireGestureRecognizerToFail:tap3];// 同时发生时，只触发tap3
}

/**
 *  2. 轻扫手势示例
 */
- (void)swipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;// 默认右扫
    [self.view addGestureRecognizer:swipe];
}

/**
 *  3. 捏合手势示例
 */
- (void)pinchGesture
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.view addGestureRecognizer:pinch];
}

/**
 *  4. 拖移手势示例
 */
- (void)panGesture
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [_genstureLabel addGestureRecognizer:pan];// 注册事件到_genstureLabel
}

/**
 *  5. 旋转手势示例
 */
- (void)rotationGesture
{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [_genstureLabel addGestureRecognizer:rotation];
}

/**
 *  6. 长按手势示例
 */
- (void)longPressGesture
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration = 2;// 设置有效触发长按事件时间
    [self.view addGestureRecognizer:longPress];
}

#pragma mark - 响应方法
// 单击（一个手指）
- (void)singleTap:(UITapGestureRecognizer *)tap
{
    _genstureLabel.text = @"一个手指单击";
}

// 双击（一个手指）
- (void)doubleTap:(UITapGestureRecognizer *)tap
{
    _genstureLabel.text = @"一个手指双击";
}

// 单击（两个手指）
- (void)singleTwoFingerTap:(UITapGestureRecognizer *)tap
{
    _genstureLabel.text = @"两个手指单击";
}

// 滑动
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    _genstureLabel.text = @"向左轻扫";
}

// 捏合
- (void)pinchAction:(UIPinchGestureRecognizer *)pinch
{
    float scale = pinch.scale;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, scale, scale);
    if (scale > 1) {
        _genstureLabel.text = @"捏合放大";
    }
    else if (scale < 1) {
        _genstureLabel.text = @"捏合缩小";
    }
}

// 长按
- (void)longPressAction:(UILongPressGestureRecognizer *)longPress
{
    _genstureLabel.text = @"已经长按2秒";
}

// 旋转
- (void)rotationAction:(UIRotationGestureRecognizer *)rotationGes
{
    rotationGes.view.transform = CGAffineTransformRotate(rotationGes.view.transform, rotationGes.rotation);
    rotationGes.rotation = M_PI;
    _genstureLabel.text = @"旋转";
}

// 拖动
- (void)panAction:(UIPanGestureRecognizer *)pan
{
    // 移动的量（向量）
    CGPoint translation = [pan translationInView:self.view];
    // 计算移动后的位置坐标
    pan.view.center = CGPointMake(pan.view.center.x + translation.x, pan.view.center.y + translation.y);
    // 设置坐标和速度
    [pan setTranslation:CGPointZero inView:self.view];
    _genstureLabel.text = @"把我放哪儿啊？";
}
@end
