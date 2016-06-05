//
//  FileViewController.h
//  L1403_文件夹系统
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "File.h"

@interface FileViewController : UIViewController

/**
 *  根目录
 */
@property (nonatomic, strong) File *rootFile;

@end
