//
//  ViewController.m
//  L03图片浏览器-oc
//
//  Created by TonyEarth on 16/2/28.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UIButton *leftBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) int index;
@property (nonatomic, weak) NSArray *imageDicts;

@end

@implementation ViewController

- (IBAction)leftBtnOnClicked {
    self.index--;
    [self btnClickChange: NO];
}
- (IBAction)rightBtnOnClicked {
    self.index++;
    [self btnClickChange: YES];
}

/**
 *  获取存储图片的数组
 *
 *  @return 存储图片的数组（字典数组）
 */
- (NSArray *)imageDicts
{
    if (_imageDicts.count == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageData" ofType:@"plist"];
        _imageDicts = [NSArray arrayWithContentsOfFile:path];
        NSLog(@"still");
    }
    return _imageDicts;
}

/**
 *  切换图片
 *
 *  @param isAdd 是否向后(右)翻
 */
- (void) btnClickChange: (BOOL) isAdd
{
    NSLog(@"%@", [NSString stringWithFormat:@"%d/%d", (self.index + (isAdd ? 1 : -1)), self.imageDicts.count]);
    self.topLabel.text = [NSString stringWithFormat:@"%d/%lu", (self.index + (isAdd ? 1 : -1)), (unsigned long)self.imageDicts.count];
    self.descLabel.text = self.imageDicts[self.index][@"description"];
    self.imageView.image = [UIImage imageNamed:self.imageDicts[self.index][@"name"]];
    
    self.leftBtn.enabled = (self.index != 0);// 左边按钮的状态
    self.rightBtn.enabled = (self.index != 4);// 右边按钮的状态
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
