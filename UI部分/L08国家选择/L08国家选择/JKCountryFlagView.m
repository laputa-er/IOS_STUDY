//
//  JKCountryFlagView.m
//  L08国家选择
//
//  Created by TonyEarth on 16/3/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKCountryFlagView.h"
#import "JKCountryInfo.h"
@implementation JKCountryFlagView

+ (instancetype)countryView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JKCountryFlagView" owner:self options:nil] lastObject];
}
// 赋值
- (void)setCountryModel:(JKCountryInfo *)countryModel
{
    if (_countryModel != countryModel) {
        _countryModel = countryModel;
        self.name.text = _countryModel.name;
        self.flag.image = [UIImage imageNamed:_countryModel.icon];
    }
}

+ (CGFloat)rowHeight
{
    return 54;
}

@end
