//
//  ViewController.m
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Builder.h"
#import "Engine.h"
#import "YEngine.h"
#import "Wheels.h"
#import "Door.h"

@interface ViewController ()
@property (nonatomic, strong) Builder *builder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建组装着（指挥者）
    self.builder = [[Builder alloc] init];
    
    // 指定承包商
    self.builder.engine = [[YEngine alloc] init];
    self.builder.wheels = [[Wheels alloc] init];
    self.builder.door = [[Door alloc] init];
    
    // 构件所有部件
    [self.builder buildAllParts];
    
    // 获取产品信息
    NSLog(@"%@", self.builder.productsInfo);
}

@end
