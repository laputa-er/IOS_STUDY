//
//  Builder.m
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "Builder.h"

@implementation Builder
- (void)buildAllParts {
    // 创建所有部件
    [self.engine build];
    [self.wheels build];
    [self.door build];
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    
    // 组装产品信息
    dataDic[@"engine"] = [self.engine infomation];
    dataDic[@"wheels"] = [self.wheels infomation];
    dataDic[@"door"] = [self.door infomation];
    
    self.productsInfo = dataDic;
}
@end
