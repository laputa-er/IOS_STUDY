//
//  ViewController.m
//  L0602封装CAEmitterLayer
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "CAEmitterLayerUIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    CAEmitterLayerUIView *layerView = [[CAEmitterLayerUIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    NSLog(@"%@", layerView.layer);
}

@end
