#import <UIKit/UIKit.h>
#import "JKGroupModel.h"

//------ 协议（为代理对象定义协议）
@protocol HeaderViewDelegate <NSObject>

@optional
- (void)clickView;

@end

//------ 接口
@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, assign) id<HeaderViewDelegate>delegate;// 代理对象
@property (nonatomic, strong) JKGroupModel *groupModel;

// 构造器
+ (instancetype)headerView:(UITableView *)tableView;

@end
