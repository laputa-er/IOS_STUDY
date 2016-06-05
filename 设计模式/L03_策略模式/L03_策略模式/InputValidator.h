//
//  InputValidator.h
//  L03_策略模式
//
//  Created by TonyEarth on 16/5/1.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InputValidator : NSObject

// 错误信息：当 validateInput为NO的时候，我们来读取errorMessage
@property (nonatomic, strong) NSString *errorMessage;

/**
 *  校验输入
 *
 *  @param input 输入控件
 *
 *  @return YES 测试通过， NO 测试不通过
 */
- (BOOL)validateInput:(UITextField *)input;

@end
