//
//  JKCountryFlagView.h
//  L08国家选择
//
//  Created by TonyEarth on 16/3/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKCountryInfo;
@interface JKCountryFlagView : UIView

// IBOutlet 属性
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *flag;

// 普通属性
@property (nonatomic, strong) JKCountryInfo *countryModel;

// 构造器(工厂方法)
+ (instancetype)countryView;

// 类方法
+ (CGFloat)rowHeight;

@end
