//
//  DeviceFactory.m
//  L0702_简单工厂
//
//  Created by TonyEarth on 16/5/20.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "DeviceFactory.h"

@implementation DeviceFactory

+ (BaseDevice <PhoneProtocol> *)deviceFactoryWithDeviceType:(EDeviceType)type {
    BaseDevice <PhoneProtocol> *device = nil;
    
    if (type == kiPhone) {
        device = [[iPhoneDevice alloc] init];
    }
    else if (type == kAndroid) {
        device = [[AndroidDevice alloc] init];
    }
    else if (type == kNokia) {
        device = [[NokiaDevice alloc] init];
    }
    return device;
}

@end
