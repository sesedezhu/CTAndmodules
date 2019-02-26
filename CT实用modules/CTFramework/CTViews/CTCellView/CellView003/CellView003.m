//
//  CellView003.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/26.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView003.h"

@implementation CellView003
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    //设置此属性，点击cell不会有灰色显示
    //    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置此属性，是否显示系统右侧图标
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [self addSubview:self.Lab_left];
    [self addSubview:self.Ima_left];
    [self addSubview:self.View_line];
    
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .rightSpaceToView(contentView, -CONVER_VALUE(15))
    .heightIs(1);
    
    _Ima_left.sd_layout
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .bottomSpaceToView(_View_line, CONVER_VALUE(21))
    .widthIs(CONVER_VALUE(21))
    .heightIs(CONVER_VALUE(18));
    
    _Lab_left.sd_layout
    .leftSpaceToView(_Ima_left, 15)
    .rightSpaceToView(contentView, CONVER_VALUE(15))
    .bottomEqualToView(_Ima_left)
    .topEqualToView(_Ima_left);
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [CTUIManagers createLabelText:@"联系我们"];
        _Lab_left.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_left;
}
- (UIImageView *)Ima_left{
    if (!_Ima_left) {
        _Ima_left = [CTUIManagers createImageViewURL:nil placeholderImage:@"MyHelp001"];
    }
    return _Ima_left;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _View_line;
}
@end
