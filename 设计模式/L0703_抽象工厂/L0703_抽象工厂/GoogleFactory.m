//
//  GoogleFactory.m
//  L0703_抽象工厂
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "GoogleFactory.h"
#import "AndroidPhone.h"
#import "AndroidWatch.h"

@implementation GoogleFactory

- (BasePhone *)createPhone {
    return [[AndroidPhone alloc] init];
}

- (BaseWatch *)createWatch {
    return [[AndroidWatch alloc] init];
}

@end
