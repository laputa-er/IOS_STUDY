//
//  PhoneNumberValidator.m
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "PhoneNumberValidator.h"
#import "RegExCategories.h"

@implementation PhoneNumberValidator
- (BOOL)validateInput:(UITextField *)input {
    
    if (input.text.length <= 0) {
        
        self.errorMessage = @"没有输入";
        
    } else {
        
        BOOL isMatch = [input.text isMatch:RX(@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$")];
        if (isMatch == NO) {
            
            self.errorMessage = @"请输入正确的手机号码";
            
        } else {
            
            self.errorMessage = nil;
        }
    }
    
    return self.errorMessage == nil;
}
@end
