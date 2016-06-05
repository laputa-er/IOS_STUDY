//
//  PhoneNumberValidator.h
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "InputValidator.h"

@interface PhoneNumberValidator : InputValidator
- (BOOL)validateInput:(UITextField *)input;
@end
