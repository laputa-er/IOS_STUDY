//
//  AddViewController.m
//  L12通讯录
//
//  Created by TonyEarth on 16/3/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AddViewController.h"
#import "JKContactModel.h"
@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addAction;
- (IBAction)backAction:(id)sender;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加观察者:姓名输入框内容发生改变时调用 textChange 方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    // 添加观察者:密码输入框内容发生改变时调用 textChange 方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 让性命文本框 autofocus
    [self.nameField becomeFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addAction {
    // 1. 关闭当前视图控制器
    [self.navigationController popViewControllerAnimated:YES];
    // 2. 通过代理对象传值
    if ([self.delegate respondsToSelector:@selector(addContact:didAddContact:)]) {
        // 创建数据模型
        JKContactModel *contactModel = [[JKContactModel alloc] init];
        contactModel.name = self.nameField.text;
        contactModel.phone = self.phoneField.text;
        // 通过代理对象将数据添加到 联系人列表视图的数组中
        [self.delegate addContact:self didAddContact:contactModel];
    }
}

// 返回
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  改变登录按钮的可点击状态
 */
- (void)textChange
{
    self.addBtn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}
@end
