//
//  BusinessCardUIVIew.m
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BusinessCardUIView.h"

@interface BusinessCardUIView ()

@property (nonatomic, strong) UILabel *nameLabel;// 姓名控件
@property (nonatomic, strong) UIView *lineView;// 线条控件
@property (nonatomic, strong) UILabel *phoneNumberLabel;// 电话号码控件

@end

@implementation BusinessCardUIView

// 构造函数
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

// 初始化视图
- (void)setUp {
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.borderWidth = 0.5f;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowRadius = 1.f;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    
    // 初始化姓名控件
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 150, 25)];
    self.nameLabel.font = [UIFont fontWithName:@"Avenir-Light" size:20.f];
    
    // 初始化线条
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 45, 200, 5)];
    
    // 初始化电话号码控件
    self.phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(41, 105, 150, 20)];
    self.phoneNumberLabel.textAlignment = NSTextAlignmentRight;
    self.phoneNumberLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:16.f];
    
    // 添加到视图
    [self addSubview:self.nameLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.phoneNumberLabel];
}

// 载入数据（通过实现了 BusinessCardAdapterProtocol 的数据模型）
- (void)loadData:(id<BusinessCardAdapterProtocol>)data {
    self.name = [data name];
    self.lineColor = [data lineColor];
    self.phoneNumber = [data phoneNumber];
}

#pragma mark - setter getter
// name
@synthesize name = _name;
- (void)setName:(NSString *)name
{
    _name = name;
    _nameLabel.text = name;
}
- (NSString *)name
{
    return _name;
}

// lineColor
@synthesize lineColor = _lineColor;
- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    _lineView.backgroundColor = _lineColor;
}
- (UIColor *)lineColor
{
    return _lineColor;
}

// phoneNumber
@synthesize phoneNumber = _phoneNumber;
- (void)setPhoneNumber:(NSString *)phoneNumber
{
    _phoneNumber = phoneNumber;
    _phoneNumberLabel.text = phoneNumber;
}

- (NSString *)phoneNumber
{
    return _phoneNumber;
}

@end
