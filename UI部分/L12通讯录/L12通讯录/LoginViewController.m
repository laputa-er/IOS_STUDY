//
//  LoginViewController.m
//  L12通讯录
//
//  Created by TonyEarth on 16/3/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RmbPwdKey @"rmb_pwd"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UISwitch *rembField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加观察者:姓名输入框内容发生改变时调用 textChange 方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    // 添加观察者:密码输入框内容发生改变时调用 textChange 方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    // 读取上次配置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameField.text = [defaults valueForKey:UserNameKey];
    self.pwdField.text = [defaults valueForKey:PwdKey];
    self.rembField.on = [defaults boolForKey:RmbPwdKey];
    // 如果上次登录时选择了记住密码，则自动填写密码字段，并激活登录按钮
    if (self.rembField.isOn) {
        self.pwdField.text = [defaults valueForKey:PwdKey];
        self.loginBtn.enabled = YES;
    }
}

- (IBAction)loginAction {
    if (![self.nameField.text isEqualToString:@"jike"]) {
        [MBProgressHUD showError:@"账号不存在"];
        return;
    }
    if (![self.pwdField.text isEqualToString:@"qq"]) {
        [MBProgressHUD showError:@"密码错误"];
        return;
    }
    [MBProgressHUD showMessage:@"努力加载中"];
    // 2秒后（模拟网络请求）跳转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 移除蒙板弹窗
        [MBProgressHUD hideHUD];
        [self performSegueWithIdentifier:@"LoginToContact" sender:nil];
    });
    // 存储数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:UserNameKey];
    [defaults setObject:self.pwdField.text forKey:PwdKey];
    [defaults setBool:self.rembField.isOn forKey:RmbPwdKey];
    // 设置同步
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
/**
 *  跳转之前之行
 *
 *  @param segue 跳转的信息
 *  @param sender 和performSegueWithIdentifier方法传入的sender是同一个
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // 1. 获取跳转目的地视图的控制器
    UIViewController *contactVC = segue.destinationViewController;
    // 2. 设置标题（传值）
    contactVC.title = [NSString stringWithFormat:@"%@的联系人列表", self.nameField.text];
}


/**
 *  改变登录按钮的可点击状态
 */
- (void)textChange
{
    self.loginBtn.enabled = (self.nameField.text.length && self.pwdField.text.length);
}
@end
