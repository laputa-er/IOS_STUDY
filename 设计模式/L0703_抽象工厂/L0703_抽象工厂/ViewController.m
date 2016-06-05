//
//  ViewController.m
//  L0703_抽象工厂
//
//  Created by TonyEarth on 16/5/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "FactoryManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取工厂
    BaseFactory *factory = [FactoryManager factoryWithBrand:kGoogle];
    
    // 创建商品
    BasePhone *phone = [factory createPhone];
    BaseWatch *watch = [factory createWatch];
    
    NSLog(@"%@ %@", phone, watch);
}

@end
