//
//  EditViewController.m
//  L12通讯录
//
//  Created by TonyEarth on 16/3/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "EditViewController.h"
#import "JKContactModel.h"
@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *edit;

- (IBAction)saveAction:(id)sender;
- (IBAction)editAction:(id)sender;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 通过数据模型初始化页面数据
    self.nameField.text = self.contactMode.name;
    self.phoneField.text = self.contactMode.phone;
    
    // 添加观察者:姓名输入框内容发生改变时调用 textChange 方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    // 添加观察者:密码输入框内容发生改变时调用 textChange 方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveAction:(id)sender {
    // 1. 关闭当前页面
    [self.navigationController popViewControllerAnimated:YES];
    // 2. 通知代理
    if ([self.delegate respondsToSelector:@selector(editViewController:didSavaContact:)]) {
        // 更新编辑界面的显示
        self.contactMode.name = self.nameField.text;
        self.contactMode.phone = self.phoneField.text;
        // 通过代理更新联系人列表界面的显示
        [self.delegate editViewController:self didSavaContact:self.contactMode];
    }
}

- (IBAction)editAction:(UIBarButtonItem *)sender {
    // 进入不可编辑状态
    if (self.nameField.enabled) {
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        sender.title = @"编辑";
        // 使用原来的数据还原输入框显示
        self.nameField.text = self.contactMode.name;
        self.phoneField.text = self.contactMode.phone;
    }
    // 进入可编辑状态
    else {
        self.nameField.enabled = YES;
        self.phoneField.enabled = YES;
        [self.view endEditing:NO];
        self.saveBtn.hidden = NO;
        sender.title = @"取消";// 更新编辑按钮文案
    }
}

/**
 *  改变登录按钮的可点击状态
 */
- (void)textChange
{
    self.edit.enabled = (self.nameField.text.length && self.phoneField.text.length);
}
@end
