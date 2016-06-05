//
//  ViewController.m
//  L04LoL英雄展示
//
//  Created by TonyEarth on 16/2/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"
#import "JKHero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

/**
 *  获取英雄列表数据(懒加载)
 *
 *  @return JKHero类型的可变数组
 */
- (NSArray *) heros
{
    if (!_heros) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dict in array) {
            JKHero *hero = [JKHero heroWithDict:dict];
            [arrayM addObject:hero];
        }
        _heros = [arrayM copy];
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

// 每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

// 每组默认有多少行(可以不实现，默认就是1)
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}

#pragma mark - UITableViewDelegate

// 设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// 创建tableView中的所有cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"heroCell";
    // 创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    // 设置cell的样式风格
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 设置cell内容
    JKHero *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    return cell;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
