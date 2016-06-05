//
//  BusinessCardAdapter.h
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BusinessCardAdapterProtocol.h"

/**
 采纳 商务名片协议
 */
@interface BusinessCardAdapter : NSObject <BusinessCardAdapterProtocol>

// 输入适配器的数据
@property (nonatomic, weak) id data;

// 初始化时为上面的属性赋值
- (instancetype)initWithData:(id) data;

@end
