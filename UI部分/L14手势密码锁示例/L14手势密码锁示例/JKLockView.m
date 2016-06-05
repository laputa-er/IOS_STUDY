//
//  JKLockView.m
//  L14手势密码锁示例
//
//  Created by TonyEarth on 16/3/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKLockView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

// const: 定义只读变量，在其他类中不能声明同名的变量
CGFloat const btnCount = 9;// 按钮总数
CGFloat const btnW = 74;// 按钮宽
CGFloat const btnH = 74;// 按钮高
CGFloat const viewY = 300;
int const columnCount = 3;// 按钮列数

@interface JKLockView ()

@property (nonatomic, strong) NSMutableArray *selectedBtns;
@property (nonatomic, assign) CGPoint currentPoint;// 如果手指连到已经被连接到线中的点，这个点就被设置为当前点（意味着连线完毕，开始解锁）

@end
@implementation JKLockView


#pragma mark - 绘制
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 如果没有选中按钮，则不进行绘制
    if (self.selectedBtns.count == 0) {
        return;
    }
    
    // 利用贝塞尔曲线绘制手势路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 8;// 线宽
    path.lineJoinStyle  = kCGLineJoinRound;// 转折点样式
    [[UIColor colorWithRed:32/255.0 green:210/255.0 blue:254/255.0 alpha:0.5] set];// 颜色
    // 连线
    for (int i = 0; i < self.selectedBtns.count; i++) {
        UIButton *button = self.selectedBtns[i];
        // 移动到起点
        if (i == 0) {
            [path moveToPoint:button.center];
        }
        // 连线
        else {
            [path addLineToPoint:button.center];
        }
    }
    [path addLineToPoint:self.currentPoint];
    [path stroke];
}

#pragma mark - 构造函数
// 通过代码创建该类实例时调用该构造器
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addButton];
    }
    return self;
}

// 通过 storyboard 或者 xib 文件创建的时候调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addButton];
    }
    return self;
}

#pragma mark - 其它实例方法
/**
 *  为视图添加所有按钮
 */
- (void)addButton
{
    CGFloat height = 0;
    CGFloat margin = (self.frame.size.width - columnCount * btnW) / (columnCount + 1);// 按钮之间的间距
    for (int i = 0; i < btnCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置图片(默认)
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        btn.userInteractionEnabled = NO;// 是否忽略用户操作产生的相关事件
        // 设置图片（选中）
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        btn.tag = i;// 做标记
        // 设置按钮的frame
        int row = i / columnCount;// 所在行
        int column = i % columnCount;// 所在列
        CGFloat btnX = margin + column * (btnW + margin);// 距外部视图左边距
        CGFloat btnY = row * (btnW + margin);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        height = btnH + btnY;
        // 添加到视图中
        [self addSubview:btn];
    }
    // 设置按钮所在View的frame
    self.frame = CGRectMake(0, viewY, kScreenWidth, height);
}

/**
* 获取数组（懒加载）
*
*  @return 存储被勾选的按钮所在的数组
*/
- (NSMutableArray *)selectedBtns
{
    if (_selectedBtns == nil) {
        _selectedBtns = [NSMutableArray array];
    }
    return _selectedBtns;
}

#pragma mark - 私有方法（在间接中没有声明）
/**
 *  获取触摸点坐标
 *
 *  @param touches 所有触摸点
 *
 *  @return 触摸点坐标
 */
- (CGPoint)pointWithTouch:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];// 拿出一个触摸点
    CGPoint point = [touch locationInView:self];// 获取触摸点的坐标
    return point;
}

/**
 *  根据坐标获取包含改坐标的按钮
 *
 *  @param point 坐标
 *
 *  @return 按钮
 */
- (UIButton *)buttonWithPoint:(CGPoint)point
{
    for (UIButton *btn in self.subviews) {
        // 判断某个坐标是否位于某个控件中
        if (CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}

#pragma mark - 触摸事件处理方法
/**
 *  按钮被触摸时，将被触摸的按钮添加到被选中按钮的数组中
 *
 *  @param touches 所有触摸点
 *  @param event   事件对象
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1. 拿到触摸点
    CGPoint point = [self pointWithTouch:touches];
    // 2. 根据触摸的点拿到对应的按钮
    UIButton *btn = [self buttonWithPoint:point];
    // 3. 设置状态
    // 确保触摸点存在对应的按钮
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.selectedBtns addObject:btn];// 往数组或字典中添加对象的时候，要判断这个对象是否存在
    }
}

/**
 *  手指移动到下一个按钮上时，将该按钮添加到被选中的按钮中，并触发连线
 *
 *  @param touches 被触摸的按钮
 *  @param event   事件对象
 */
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1. 拿到触摸点
    CGPoint point = [self pointWithTouch:touches];
    // 2. 根据触摸的点拿到对应的按钮
    UIButton *btn = [self buttonWithPoint:point];
    // 3. 改变按钮状态，添加到被选中的按钮数组中
    // 下一个按钮还没被选中过，则加入到被选按钮数组中
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.selectedBtns addObject:btn];
    }
    // 下一个按钮是已经被选中的按钮，则设置为当前点（不计入连线）
    else {
        self.currentPoint = point;
    }
    [self setNeedsDisplay];// 触发drawRect，重绘连线
}

/**
 *  触摸事件结束时，调用代理对象验证手势密码
 *
 *  @param touches 被触摸的按钮
 *  @param event   事件对象
 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(lockView:didFinishPath:)]) {
        // 将手势锁信息抽象为一串数字(tag)组成的字符串
        NSMutableString *path = [NSMutableString string];
        for (UIButton *btn in self.selectedBtns) {
            [btn setSelected:NO];
            [path appendFormat:@"%ld", (long)btn.tag];
        }
        // 调用代理对象验证手势密码
        [self.delegate lockView:self didFinishPath:path];
    }
    // 重置之前被选中的的按钮的状态(通过 makeObjectsPerformSelector 向数组中的每一个对象发送信息)
    // [self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    
    // 清空被选中按钮组成的数组
    [self.selectedBtns removeAllObjects];
    // 重绘，触发drawRect
    [self setNeedsDisplay];
}

/**
 *  触摸事件被意外中断时，当作触摸事件结束处理
 *
 *  @param touches 被触摸的按钮
 *  @param event   事件对象
 */
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded: touches withEvent:event];
}
@end
