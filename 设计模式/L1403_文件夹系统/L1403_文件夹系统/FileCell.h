//
//  FileCell.h
//  L1403_文件夹系统
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileCell : UITableViewCell

@property (nonatomic, weak) id data;
@property (nonatomic, weak) NSIndexPath *indexPath;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIViewController *controller;


- (void)loadContent;

@end
