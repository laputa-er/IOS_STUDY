//
//  BussinessCardAdapterProtocol.h
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义商务名片适配器协议
@protocol BusinessCardAdapterProtocol <NSObject>
// 获取名字
- (NSString *)name;
// 获取线的颜色
- (UIColor *)lineColor;
// 获取电话号码
- (NSString *)phoneNumber;
@end
