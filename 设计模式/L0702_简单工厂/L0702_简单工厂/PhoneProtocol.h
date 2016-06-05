//
//  PhoneProtocol.h
//  L0702_简单工厂
//
//  Created by TonyEarth on 16/5/19.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhoneProtocol <NSObject>

@required

/**
 *  打电话
 */
- (void)phoneCall;

/**
 *  发短信
 */
- (void)sendMessage;
@end
