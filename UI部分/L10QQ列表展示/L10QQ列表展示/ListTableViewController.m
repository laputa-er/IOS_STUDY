//
//  ListTableViewController.m
//  L10QQ列表展示
//
//  Created by baidu on 16/3/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ListTableViewController.h"
#import "JKGroupModel.h"
#import "JKFriendsModel.h"
#import "HeaderView.h"
#import "ViewController.h"

@interface ListTableViewController ()<HeaderViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ListTableViewController

// 懒加载
- (NSArray *)dataArray
{
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile: path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            JKGroupModel *groupModel = [JKGroupModel GroupWithDict:dict];
            [muArray addObject:groupModel];
        }
        _dataArray = [muArray copy];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 40;
    [self clipExtraCellLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// num of section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}
// num of cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JKGroupModel *groupModel =  self.dataArray[section];
    NSInteger count = groupModel.isOpen ? groupModel.friends.count : 0;
    return count;
}
// 创建 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"friendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    JKGroupModel *groupModel = self.dataArray[indexPath.section];
    JKFriendsModel *friendModel = groupModel.friends[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:friendModel.icon];
    cell.textLabel.text = friendModel.name;
    cell.detailTextLabel.text = friendModel.intro;
    
    return cell;
}

#pragma mark - UITableView delagate
// 添加自定义的头视图：初始化TableView中每个section中的header部分
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *header = [HeaderView headerView:tableView];
    header.delegate = self;// 将自身作为代理对象
    header.groupModel = self.dataArray[section];
    return header;
}

// cell被点击（选中进入）时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 通过导航控制器进入一个新的 ViewController
    ViewController *viewCtrl = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewCtrl animated:NO];
}

#pragma mark - HeadViewDelegate
- (void)clickView
{
    [self.tableView reloadData];
}

#pragma mark - 去掉多余的cell的线
- (void)clipExtraCellLine:(UITableView *)tableView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
