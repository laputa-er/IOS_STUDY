//
//  EmailValidator.m
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "EmailValidator.h"
#import "RegExCategories.h"

@implementation EmailValidator
// 重写父类方法
- (BOOL)validateInput:(UITextField *)input {
    if (input.text.length <= 0) {
        self.errorMessage = @"没有输入";
    } else {
        BOOL isMatch = [input.text isMatch:RX(@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")];
        if (isMatch == NO) {
            self.errorMessage = @"请输入正确的邮箱";
        }
        else {
            self.errorMessage = nil;
        }
    }
    return self.errorMessage == nil;
    
}
@end
