//
//  DeviceFactory.h
//  L0702_简单工厂
//
//  Created by TonyEarth on 16/5/20.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDevice.h"
#import "iPhoneDevice.h"
#import "AndroidDevice.h"
#import "NokiaDevice.h"

typedef enum : NSInteger {
    kiPhone = 0x11,
    kAndroid,
    kNokia,
} EDeviceType;

@interface DeviceFactory : NSObject

/**
 *  工厂方法
 *  创建指定类型的手机
 *
 *  @param type 类型
 *
 *  @return 手机实例
 */
+ (BaseDevice <PhoneProtocol> *)deviceFactoryWithDeviceType:(EDeviceType)type;

@end
