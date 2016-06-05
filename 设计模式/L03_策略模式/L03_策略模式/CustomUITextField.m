//
//  CustomUITextField.m
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "CustomUITextField.h"

@implementation CustomUITextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, self.frame.size.height)];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.font = [UIFont fontWithName:@"Avenir-Book" size:12.f];
    self.layer.borderWidth = 0.5f;
}

- (BOOL)validate {
    return [self.validator validateInput:self];
}
@end
