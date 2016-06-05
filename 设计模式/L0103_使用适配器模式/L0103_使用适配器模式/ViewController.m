//
//  ViewController.m
//  L0103_使用适配器模式
//
//  Created by TonyEarth on 16/4/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "BusinessCardUIView.h"

#import "Model.h"
#import "ModelAdapter.h"

#import "NewCardModel.h"
#import "NewCardModelAdapter.h"

#import "BusinessCardAdapter.h"

#import "CardAdapter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self classAdapterEmp];
}

- (void)classAdapterEmp {
    // 1. 创建商务名片实例
    BusinessCardUIView *cardView = [[BusinessCardUIView alloc] initWithFrame:BUSINESS_FRAME];
    cardView.center = self.view.center;
    
    // 2. 初始化要数据
    // 第一种数据
    /*
    Model *model = [[Model alloc] init];
    model.name = @"TZM";
    model.lineColor = [UIColor redColor];
    model.phoneNumber = @"101 - 5687 -000";
    
    
    
    // 3. 将数据连接到适配器
    BusinessCardAdapter *modelAdapter = [[ModelAdapter alloc] initWithData:model];
    */
    
    // 第二种数据
     NewCardModel *newCardModel = [[NewCardModel alloc] init];
     newCardModel.name = @"JikeXueYuan";
     newCardModel.colorHexString = @"black";
     newCardModel.phoneNumber = @"13671208074";
     // 3. 将数据连接到适配器
     BusinessCardAdapter *newCardModelAdapter = [[NewCardModelAdapter alloc] initWithData:newCardModel];
    
    // 4. 将适配器连接到视图
    [cardView loadData:newCardModelAdapter];
    
    [self.view addSubview:cardView];

}

- (void)objectAdapterEmp {
    // 1. 创建商务名片实例
    BusinessCardUIView *cardView = [[BusinessCardUIView alloc] initWithFrame:BUSINESS_FRAME];
    cardView.center = self.view.center;
    
    // 2. 初始化要数据
    // 第一种数据
    Model *model = [[Model alloc] init];
    model.name = @"TZM";
    model.lineColor = [UIColor redColor];
    model.phoneNumber = @"101 - 5687 -000";
    
    // 第二种数据
    /*
    NewCardModel *newCardModel = [[NewCardModel alloc] init];
    newCardModel.name = @"JikeXueYuan";
    newCardModel.colorHexString = @"black";
    newCardModel.phoneNumber = @"13671208074";
    */
    
    // 3. 将数据连接到适配器
    BusinessCardAdapter *modelAdapter = [[CardAdapter alloc] initWithData:model];
    
    // 4. 将适配器连接到视图
    [cardView loadData:modelAdapter];
    
    [self.view addSubview:cardView];
}

@end
