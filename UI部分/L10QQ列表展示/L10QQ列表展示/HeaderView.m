
#import "HeaderView.h"
#import "JKGroupModel.h"
@implementation HeaderView
{
    UIButton *_arrowBtn;// 三角按钮（展开和关闭）
    UILabel *_label;
}

+ (instancetype)headerView:(UITableView *)tableView
{
    static NSString *identifier = @"header";
    // 尝试获取该 UITableViewHeaderFooterView
    HeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[HeaderView alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

// 重写 UITableViewHeaderFooterView 的构造器
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 初始化_arrowBtn(带三角的按钮)
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];// 北京图片
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];// 标题
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);// 整体内边距
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;// 左对齐
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);// 文字部分的内边距
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];// 注册点击事件
        button.imageView.clipsToBounds = NO;// 不裁剪图片
        _arrowBtn = button;
        [self addSubview:_arrowBtn];

        // 初始化_label
        UILabel *labelRight = [[UILabel alloc] init];
        labelRight.textAlignment = NSTextAlignmentCenter;
        _label = labelRight;
        [self addSubview:_label];
    }
    return self;
}

// 重写布局方法:为_arrowBtn和_label设置布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    _arrowBtn.frame = self.bounds;
    _label.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}
// 赋值
- (void)setGroupModel:(JKGroupModel *)groupModel
{
    _groupModel = groupModel;
    [_arrowBtn setTitle:_groupModel.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%@/%lu", _groupModel.online, (unsigned long)_groupModel.friends.count];
}

// 展开或关闭组
- (void)buttonAction
{
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.delegate respondsToSelector:@selector(clickView)]) {
        [self.delegate clickView];
    }
}

// 父视图发生变化时被调用
- (void)didMoveToSuperview
{
    // 如果群组被展开了，则将按钮的icon（三角按钮）旋转180度
    NSLog(@"%s", self.groupModel.isOpen ? "YES" : "no");
    _arrowBtn.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

@end
