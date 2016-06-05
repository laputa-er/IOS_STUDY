//
//  CustomUITextField.h
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"

@interface CustomUITextField : UITextField

// 策略
@property (nonatomic, strong) InputValidator *validator;
// 构造函数
- (instancetype)initWithFrame:(CGRect)frame;

/**
 *  校验输入合法性
 *
 *  @return YES 合法， NO 不合法
 */
- (BOOL)validate;

@end
