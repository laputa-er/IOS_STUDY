//
//  Builder.h
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEngine.h"
#import "AbstractWheels.h"
#import "AbstractDoor.h"
#import "BuilderProtocol.h"

@interface Builder : NSObject
@property (nonatomic, strong) id <BuilderProtocol, AbstractEngine> engine;
@property (nonatomic, strong) id <BuilderProtocol, AbstractWheels> wheels;
@property (nonatomic, strong) id <BuilderProtocol, AbstractDoor> door;

/* 产品信息 */
@property (nonatomic, strong) NSDictionary *productsInfo;

/**
 *  构件所有部件
 */
- (void)buildAllParts;

@end
