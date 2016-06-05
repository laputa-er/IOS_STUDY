//
//  FileViewController.m
//  L1403_文件夹系统
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "FileViewController.h"
#import "FileCell.h"
@interface FileViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.rootFile.name;
    [self initTableView];
}

#pragma mark - tableView相关
// 初始化 tableView
- (void)initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[FileCell class] forCellReuseIdentifier:@"fileCell"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rootFile.childFiles.count;
}

// 初始化每个 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    cell.indexPath = indexPath;
    cell.tableView = tableView;
    cell.controller = self;
    
    //  传入节点File
    cell.data = self.rootFile.childFiles[indexPath.row];
    [cell loadContent];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}
@end
