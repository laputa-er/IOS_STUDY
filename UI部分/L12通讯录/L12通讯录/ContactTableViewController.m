//
//  ContactTableViewController.m
//  L12通讯录
//
//  Created by TonyEarth on 16/3/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ContactTableViewController.h"
#import "JKContactModel.h"
#import "AddViewController.h"
#import "EditViewController.h"

// 获取归档的文件路径
#define ContactFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contacts.data"]
@interface ContactTableViewController ()<AddViewControllerDelegate, EditViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contactArr;// 联系人数组

- (IBAction)loginOut:(id)sender;

@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self clearExtraLine:self.tableView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactPeopleCell" forIndexPath:indexPath];
    
    JKContactModel *contactModel = self.contactArr[indexPath.row];// 取出对应cell的数据
    cell.textLabel.text = contactModel.name;
    cell.detailTextLabel.text = contactModel.phone;
    // 添加箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableView delegate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 滑动删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 1. 删除对应数据模型
        [self.contactArr removeObjectAtIndex:indexPath.row];
        // 2. 刷新表视图
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        // 3. 归档
        [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
    }
}

- (NSMutableArray *)contactArr
{
    if (!_contactArr) {
        _contactArr = [NSKeyedUnarchiver unarchiveObjectWithFile:ContactFilePath];
        if (_contactArr == nil) {
            _contactArr = [NSMutableArray array];
        }
    }
    return _contactArr;
}

// 注销
- (IBAction)loginOut:(id)sender {
    // 初始化 UIAlertController,使用 actionSheet 样式
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否注销?" message:@"真的要注销吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    // 添加取消按钮（并绑定事件）
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    // 添加确定按钮（并绑定事件）
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // pop掉适当前的视图控制器
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    // 弹出这个控制器
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - EditViewController delegate
// 数据模型被改变后，刷新界面显示
- (void)editViewController:(EditViewController *)editVc didSavaContact:(JKContactModel *)model
{
    [self.tableView reloadData];
    // 归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
}

#pragma mark - AddViewController delagate
- (void)addContact:(AddViewController *)addVc didAddContact:(JKContactModel *)contact
{
    // 1. 添加数据模型
    [self.contactArr addObject:contact];
    // 2. 刷新表视图
    [self.tableView reloadData];
    // 3. 归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
}

#pragma mark - 去掉多余的线
- (void)clearExtraLine:(UITableView *)tableView
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}

#pragma mark - Navigation
// 在跳转到添加界面前为其设置代理对象（将当前的联系人列表视图控制器作为代理对象）和数据模型
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id vc = segue.destinationViewController;
    /* 设置代理 */
    // 跳转到添加联系人视图控制器
    if ([vc isKindOfClass:[AddViewController class]]) {
        AddViewController *addVc = vc;
        addVc.delegate = self;
    }
    // 跳转到编辑联系人视图控制器
    else if ([vc isKindOfClass:[EditViewController class]]) {
        // 获取点击的联系人所在cell(选中的那一行)的 NSIndexPath
        EditViewController *editVc = vc;
        // 获取选中的那一行
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        // 赋值数据模型
        editVc.contactMode = self.contactArr[path.row];
        // 赋值代理对象
        editVc.delegate = self;
    }
}
@end
