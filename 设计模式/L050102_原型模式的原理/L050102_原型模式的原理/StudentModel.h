//
//  StudentModel.h
//  L050102_原型模式的原理
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrototypeCopyProtocol.h"
@interface StudentModel : NSObject <PrototypeCopyProtocol>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSNumber *totalScore;

@end
