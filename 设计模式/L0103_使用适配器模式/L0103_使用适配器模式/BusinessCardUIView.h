//
//  BusinessCardUIVIew.h
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCardAdapterProtocol.h"

#define BUSINESS_FRAME CGRectMake(0, 0, 200, 120)// 名片尺寸

@interface BusinessCardUIView : UIView

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)UIColor *lineColor;
@property (nonatomic, strong)NSString *phoneNumber;

// 载入卡片数据
- (void)loadData:(id <BusinessCardAdapterProtocol>)data;

@end
