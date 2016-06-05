//
//  ViewController.m
//  L1302_命令模式
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "Receiver.h"
#import "Invoker.h"
#import "DarkerCommand.h"
#import "LighterCommand.h"

/**
 按钮的tag
 */
typedef enum : NSInteger {
    kAddButtonTag = 10, // 增加按钮tag枚举值
    kDelButtonTag, // 减少按钮tag枚举值
    kRolButtonTag, // 回退按钮tag枚举值
} ViewControllerEnumValue;

@interface ViewController ()
@property (nonatomic, strong) UIButton *addButton;// 增加亮度按钮
@property (nonatomic, strong) UIButton *delButton;// 减少亮度按钮
@property (nonatomic, strong) UIButton *rolButton;// 退回按钮

@property (nonatomic, strong) Receiver *receiver;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 初始化接收器
    self.receiver = [[Receiver alloc] init];
    self.receiver.clientView = self.view;// 关联客户端视图（遥控器）
    
    // 初始化按钮
    [self initButtons];
}

/**
 *  初始化按钮
 */
- (void)initButtons {
    /*1. 初始化按钮*/
    // 减少亮度按钮
    self.delButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 25, 30, 30)];
    self.delButton.tag = kDelButtonTag;
    self.delButton.layer.borderWidth = 1.f;
    
    [self.delButton setTitle:@"-"
                    forState:UIControlStateNormal];
    [self.delButton setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
    
    // 增加亮度按钮
    self.addButton = [[UIButton alloc] initWithFrame:CGRectMake(10 + 40, 25, 30, 30)];
    self.addButton.tag = kAddButtonTag;
    self.addButton.layer.borderWidth = 1.f;
    
    [self.addButton setTitle:@"+"
                    forState:UIControlStateNormal];
    [self.addButton setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
    // 回退按钮
    self.rolButton = [[UIButton alloc] initWithFrame:CGRectMake(10 + 80, 25, 90, 30)];
    self.rolButton.tag = kRolButtonTag;
    self.rolButton.layer.borderWidth = 1.f;
    
    [self.rolButton setTitle:@"回退"
                    forState:UIControlStateNormal];
    [self.rolButton setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
    
    /*2. 注册事件*/
    [self.delButton addTarget:self
                       action:@selector(buttonEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.addButton addTarget:self
                       action:@selector(buttonEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.rolButton addTarget:self
                       action:@selector(buttonEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    
    
    /*3. 添加到视图*/
    [self.view addSubview:self.delButton];
    [self.view addSubview:self.addButton];
    [self.view addSubview:self.rolButton];
}

/**
 *  为按钮绑定事件
 *
 *  @param button 需要绑定事件的按钮
 */
- (void)buttonEvent:(UIButton *)button {
    if (button.tag == kAddButtonTag) {
        NSLog(@"增加亮度");
        LighterCommand *command = [[LighterCommand alloc] initWithReceiver:self.receiver
                                                                 parameter:0.1];
        [[Invoker shareInstance] addAndExcute:command];// 添加并执行命令
    }
    else if (button.tag == kDelButtonTag) {
        NSLog(@"减少亮度");
        DarkerCommand *command = [[DarkerCommand alloc] initWithReceiver:self.receiver
                                                                paramter:0.1];
        [[Invoker shareInstance] addAndExcute:command];
    }
    else if (button.tag == kRolButtonTag) {
        NSLog(@"回退操作");
        [[Invoker shareInstance] rollBack];
    }
}
@end
