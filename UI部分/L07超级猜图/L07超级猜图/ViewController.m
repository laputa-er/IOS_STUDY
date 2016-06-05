//
//  ViewController.m
//  L07超级猜图
//
//  Created by TonyEarth on 16/3/5.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "JKQuestionInfo.h"

// 需要计算的常量
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define imgW  self.imgInsideBtn.bounds.size.width
#define kAnswerBtnTitleColor [UIColor blackColor]

// 不需要计算的常量
CGFloat const kBtnW = 35;// 按钮宽
CGFloat const kBtnH = 35;// 按钮高
CGFloat const kMarginBetweenBtns = 10;// 按钮间距
NSInteger const kOptionViewTotalCol = 7;// 备选答案总列数
NSInteger const kTrueAddScore = 200;// 猜对加分
NSInteger const kFalseDecreaseScore = -200;// 猜错减分
NSInteger const kTipDecreaseScore = -200;// 亲求提示减分

//-------------------- 扩展
@interface ViewController ()
// 顶部索引情况 label
@property (weak, nonatomic) IBOutlet UILabel *topindexLabel;
// 图片描述
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

// 金币
@property (weak, nonatomic) IBOutlet UIButton *coinBtn;

// 图片
@property (weak, nonatomic) IBOutlet UIButton *imgInsideBtn;

// 选择的答案
@property (weak, nonatomic) IBOutlet UIView *answerView;

// 备选的答案
@property (weak, nonatomic) IBOutlet UIView *optionsView;

// 模型数组
@property (strong, nonatomic) NSArray *questions;

// 下一题按钮
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

// 记录索引
@property (assign, nonatomic) int index;

// 遮盖按钮
@property (strong, nonatomic) UIButton *cover;

@end

//----------------------- 实现
@implementation ViewController

/**
 *  获取数据模型数组（懒加载）
 *
 *  @return 模型数组
 */
- (NSArray *)questions
{
    if (nil == _questions) {
        _questions = [JKQuestionInfo questions];
    }
    return _questions;
}

/**
 *  获取遮罩（懒加载），用来监听用户的点击行为
 *
 *  @return 遮罩
 */
- (UIButton *)cover
{
    if (nil == _cover) {
        _cover = [[UIButton alloc] init];
        _cover.frame = self.view.bounds;// 和最外层视图一样大
        _cover.frame = self.view.bounds;
        _cover.alpha = 0.0;// 一开始隐藏遮罩：当透明度为0时，该遮罩不会存在于任何位置
        _cover.backgroundColor = [UIColor blackColor];
        // 为遮罩注册点击事件
        [_cover addTarget:self action:@selector(imgBtnChangeOnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_cover];// 把遮罩添加到视图中
    }
    return _cover;
}

// 按钮：提示
- (IBAction)tipBtnOnClick {
    // 1. 清空答案按钮的文字
    for (UIButton *answerBtn in self.answerView.subviews) {
        [self answerBtnOnClick:answerBtn];
    }
    // 2. 取出实际答案中的第一个字
    NSString *answer = [self.questions[self.index] answer];
    NSString *firstWord = [answer substringToIndex:1];
    // 3. 模拟点击optionView中第一个正确的按钮，扣分
    for (UIButton *optionBtn in self.optionsView.subviews) {
        if ([optionBtn.currentTitle isEqualToString:firstWord]) {
            [self optionBtnOnClick:optionBtn];
            [self coinChange:kTipDecreaseScore];
        }
    }
}

// 按钮：帮助
- (IBAction)helpBtnOnClick {

}

// 按钮：大图
// 遮罩
// 图片本身
- (IBAction)imgBtnChangeOnClick {
    // 放大图片
    if (0 == self.cover.alpha) {
        CGFloat scaleX = kScreenW / imgW;// 水平方向放大倍数
        CGFloat scaleY = scaleX;// 垂直方向上放大倍数
        CGFloat translateY = self.imgInsideBtn.frame.origin.y / scaleX;// 垂直方向上的偏移（倍数）
        
        // 使用块动画
        [UIView animateWithDuration:1.0 animations:^{
            // 显示遮罩
            self.cover.alpha = 0.5;
            self.imgInsideBtn.transform = CGAffineTransformMakeScale(scaleX, scaleY);// 放大
            self.imgInsideBtn.transform = CGAffineTransformTranslate(self.imgInsideBtn.transform, 0, translateY);// 在现有的基础上向上移动
        }];
        // 将中间图片所在图层置顶
        [self.view bringSubviewToFront:self.imgInsideBtn];
    }
    // 还原图片
    else {
        // 图片还原事件
        [UIView animateWithDuration:1.0 animations:^{
            self.imgInsideBtn.transform = CGAffineTransformIdentity;
            self.cover.alpha = 0.0;
        }];
    }
}

// 按钮:下一题
- (IBAction)nextBtnOnClick {
    // 1. 索引自增（判断是否越界）
    self.index++;
    NSLog(@"INDEX == %D", self.index);
    if (self.index >= self.questions.count) {
        NSLog(@"恭喜过关！");
        #warning noCode
        self.index--;
        return;
    }
    // 2. 取出数据模型
    JKQuestionInfo *question = self.questions[self.index];
    // 3. 设置
    [self setupBaseInfo:question];
    // 4. 创建答案按钮
    [self createAnswerBtns:question];
    // 5. 创建备选答案按钮
    [self createOptionBtns:question];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index = -1;
    [self nextBtnOnClick];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 私有方法

/**
 *  设置基本信息
 *
 *  @param question 问题的数据模型
 */
- (void)setupBaseInfo: (JKQuestionInfo *)question
{
    // 恢复（enable）optionView 的用户交互
    self.optionsView.userInteractionEnabled = YES;
    // 改变顶部图片索引信息
    self.topindexLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, self.questions.count];
    // 改变图片描述
    self.descLabel.text = question.title;
    // 更换图片
    [self.imgInsideBtn setImage:question.image forState:UIControlStateNormal];
    
    // 下一题按钮状态判断改变
    self.nextBtn.enabled = (self.index != self.questions.count - 1);
}

/**
 *  创建放置答案的按钮
 *
 *  @param question 数据模型
 */
- (void)createAnswerBtns:(JKQuestionInfo *)question
{
    // 1. 清空放置答案的按钮
    for (UIButton *btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    // 2. 获取答案按钮的数量
    NSInteger answerBtnCount = question.answer.length;
    // 3. 创建放置答案的按钮
    CGFloat answerW = self.answerView.bounds.size.width;// 放答案的父容器宽度
    CGFloat answerEdgeInset = (answerW - answerBtnCount * kBtnW - (answerBtnCount - 1) * kMarginBetweenBtns) * 0.5;// 放答案的父容器两侧内边距
    
    for (int i = 0; i < answerBtnCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        CGFloat btnX = answerEdgeInset + i * (kBtnW + kMarginBetweenBtns);// 起点水平坐标
        btn.frame = CGRectMake(btnX, 0, kBtnW, kBtnH);// 设置frame
        // 设置背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        // 设置字体颜色
        [btn setTitleColor:kAnswerBtnTitleColor forState:UIControlStateNormal];
        
        // 注册点击事件
        [btn addTarget:self action:@selector(answerBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 添加到视图中
        [self.answerView addSubview:btn];
    }
}

/**
 *  设置备选字按钮（懒加载）
 *
 *  @param question 数据模型
 */
- (void)createOptionBtns:(JKQuestionInfo *)question
{
    // 备选字总个数
    int optionsCount = question.options.count;
    
    // 没有备选字按钮就创建
    if (self.optionsView.subviews.count != optionsCount) {
        CGFloat optionW = self.optionsView.bounds.size.width;// 备选字按钮父控件宽度
        CGFloat optionEdgeInset = (optionW - kOptionViewTotalCol * kBtnW - (kOptionViewTotalCol - 1) * kMarginBetweenBtns) * 0.5;// 父控件左右内边距
        for (int i = 0; i < optionsCount; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            int col = i % kOptionViewTotalCol;// 所在列
            int row = i / kOptionViewTotalCol;// 所在行
            
            CGFloat btnX = optionEdgeInset + (kBtnW + kMarginBetweenBtns) * col;// 水平坐标
            CGFloat btnY = kMarginBetweenBtns + (kBtnH + kMarginBetweenBtns) * row;// 垂直坐标
            // 设置frame
            btn.frame = CGRectMake(btnX, btnY, kBtnW, kBtnH);
            // 设置背景图
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
            // 设置字颜色
            [btn setTitleColor:kAnswerBtnTitleColor forState:UIControlStateNormal];
            // 注册点击事件
            [btn addTarget:self action:@selector(optionBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            // 添加到视图
            [self.optionsView addSubview:btn];
        }
        // 更新备选字
        for (int i = 0; i < optionsCount; i++) {
            UIButton *optionBtn = self.optionsView.subviews[i];
            [optionBtn setTitle:question.options[i] forState:UIControlStateNormal];
            optionBtn.hidden = NO;
        }
    }
}

#pragma mark - 文字按钮的点击绑定的方法
/**
 *  点击答案按钮
 *
 *  @param answerBtn 答案按钮
 */
- (void)answerBtnOnClick:(UIButton *)answerBtn
{
    NSString *answerStr = answerBtn.currentTitle;
    // 按钮没有设置字
    if (nil == answerStr) {
        return;
    }
    // 按钮有字(用户打算去掉选择作为答案的一个字)
    else {
        // 1. 清空按钮的字
        [answerBtn setTitle:nil forState:UIControlStateNormal];
        // 2. 恢复optionView中隐藏的备选字按钮
        for (UIButton *optionBtn in self.optionsView.subviews) {
            if ([answerStr isEqualToString:optionBtn.currentTitle] && optionBtn.isHidden) {
                optionBtn.hidden = NO;
                break;
            }
        }
        // 3. 如果字体颜色为错误答案的颜色，则恢复为黑色
        if (answerBtn.currentTitleColor != kAnswerBtnTitleColor) {
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:kAnswerBtnTitleColor forState:UIControlStateNormal];
            }
            // 恢复（enable）optionView的用户交互
            self.optionsView.userInteractionEnabled = YES;
        }
    }
}

/**
 *  点击备选按钮
 *
 *  @param optionBtn 备选按钮
 */
- (void)optionBtnOnClick:(UIButton *)optionBtn
{
    // 被点击的备选按钮上的字
    NSString *optionStr = optionBtn.currentTitle;
    // 1. 填字到answerView
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (nil == answerBtn.currentTitle) {
            [answerBtn setTitle:optionStr forState:UIControlStateNormal];
            break;
        }
    }
    // 2. 隐藏被点击的备选按钮
    optionBtn.hidden = YES;

    BOOL isFull = YES;
    NSMutableString *strM = [NSMutableString string];
    // 3. 将答案区按钮中字拼成一个字符串
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (nil == answerBtn.currentTitle) {
            isFull = NO;
            break;
        }
        else {
            [strM appendString:answerBtn.currentTitle];
        }
    }
    // 4. 当answerView中字满的时候
    if (YES == isFull) {
        // disable 交互，因此再点击可选答案没有意义了
        self.optionsView.userInteractionEnabled = NO;
        NSString *answer = [self.questions[self.index] answer];
        // 答案正确
        if ([strM isEqualToString:answer]) {
            for (UIButton *answerBtn in self.answerView.subviews) {
                // 设置字体为蓝色
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            // 增加金币
            [self coinChange:kTrueAddScore];
            // 1秒后跳转到下一题
            [self performSelector:@selector(nextBtnOnClick) withObject:nil afterDelay:1.0];
        }
        // 答案错误
        else {
            // 文字飘红
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
            // 减少金币
            [self coinChange:kFalseDecreaseScore];
        }
    }
}

#pragma mark - 改变得分
- (void)coinChange:(NSInteger)delCoin
{
    // 获取当前金币数量
    NSInteger currentCoin = [self.coinBtn.currentTitle integerValue];
    // 改变金币数量
    currentCoin += delCoin;
    // 充值金币数量
    NSString *coinStr = [NSString stringWithFormat:@"%d", currentCoin];
    [self.coinBtn setTitle:coinStr forState:UIControlStateNormal];
}
@end
