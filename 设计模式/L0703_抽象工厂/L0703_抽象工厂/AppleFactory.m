//
//  AppleFactory.m
//  L0703_抽象工厂
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "AppleFactory.h"
#import "iPhone.h"
#import "iWatch.h"

@implementation AppleFactory

- (BasePhone *)createPhone {
    return [[iPhone alloc] init];
}

- (BaseWatch *)createWatch {
    return [[iWatch alloc] init];
}

@end
