//
//  ViewController.m
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//


#import "ViewController.h"
#import "UIButton+inits.h"
#import "UIView+SetRect.h"
#import "UIInfomationView.h"

#import "CustomUITextField.h"
#import "EmailValidator.h"
#import "PhoneNumberValidator.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) CustomUITextField *emailField;
@property (nonatomic, strong) CustomUITextField *phoneNumberField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化按钮
    [self initButton];
    
    // 初始化输入框
    [self initCustonFields];
}

#pragma mark - 采纳 UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    CustomUITextField *customField = (CustomUITextField *)textField;
    if ([customField validate] == NO) {
        // 弹出错误提示窗
        [UIInfomationView showAlertViewWithTitle:nil
                                         message:customField
                                                .validator
                                                .errorMessage
                               cancelButtonTitle:nil
                               otherButtonTitles:@[@"确定"]
                                    clickAtIndex:^(NSInteger buttonIndex) {
                                        
                                    }];
    }
}

/**
 *  初始化输入框
 */
- (void)initCustonFields {
    // 邮箱输入框
    self.emailField = [[CustomUITextField alloc] initWithFrame:CGRectMake(30, 80, Width - 60, 30)];
    self.emailField.placeholder = @"请输入邮箱";
    self.emailField.delegate =  self;
    self.emailField.validator = [EmailValidator new];
    [self.view addSubview:self.emailField];
    
    // 手机号输入框
    self.phoneNumberField = [[CustomUITextField alloc] initWithFrame:CGRectMake(30, 80 + 40, Width - 60, 30)];
    self.phoneNumberField.placeholder = @"请输入电话号码";
    self.phoneNumberField.delegate = self;
    self.phoneNumberField.validator = [PhoneNumberValidator new];
    [self.view addSubview:self.phoneNumberField];
}

/**
 *  初始化返回按钮
 */
- (void)initButton {
    UIButton *button = [UIButton createButtonWithFrame:CGRectMake(30, 30, 90, 30)
                                            buttonType:0
                                                 title:@"Back"
                                                   tag:0
                                                target:self
                                                action:@selector(buttonEvent:)];
    [self.view addSubview:button];
}

/**
 *  结束编辑
 */
- (void)buttonEvent:(UIButton *)button {
    [self.view endEditing:YES];
}

@end
