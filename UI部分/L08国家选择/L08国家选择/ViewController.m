//
//  ViewController.m
//  L08国家选择
//
//  Created by TonyEarth on 16/3/8.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "JKCountryInfo.h"
#import "JKCountryFlagView.h"
// 扩展--------------
@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;//

@end

// 实现---------------
@implementation ViewController

/**
 *  获取plist中的字典数组
 *
 *  @return 字典数组
 */
- (NSArray *)dataArray
{
    if (!_dataArray) {
        // plist文件路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"flags" ofType:@"plist"];
        // 取出字典数组
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        // 将所有数据相放入可变数组中
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            JKCountryInfo *countryModel = [JKCountryInfo CountryWithDict:dict];
            [arrayM addObject:countryModel];
        }
        _dataArray = [arrayM copy];
        NSLog(@"path:%@", path);
    }
    NSLog(@"array:%@", _dataArray);
    return _dataArray;
}

#pragma mark - UIPickerViewDataSource
// 决定PlickerView一共的组数（共1组）
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// 每组有多少条数据
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArray.count;
}

#pragma mark - UIPickerViewDelegate
// 定义详情视图的创建过程
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    JKCountryFlagView *countryView = (JKCountryFlagView *)view;
    if (!countryView) {
        countryView = [JKCountryFlagView countryView];
    }
    countryView.countryModel = self.dataArray[row];
    return countryView;
}

// 定义行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return [JKCountryFlagView rowHeight];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
