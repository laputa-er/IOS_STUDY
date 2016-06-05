//
//  ViewController.m
//  L0702_简单工厂
//
//  Created by TonyEarth on 16/5/19.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "DeviceFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过工厂创建手机
    iPhoneDevice *iPhone = (iPhoneDevice *)[DeviceFactory deviceFactoryWithDeviceType:kiPhone];
    
    // 调用手机功能
    [iPhone fingerprintIndentification];
}

@end
