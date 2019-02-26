//
//  ThreeModelCell.m
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "ThreeModuleCell.h"

@implementation ThreeModuleCell
/** 初始化方法,自定义 cell时,不清楚高度,可以在这里添加子空间 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self.contentView addSubview:self.Lab_left];
    [self.contentView addSubview:self.Ima_left];
    [self.contentView addSubview:self.View_line];
    
    UIView *contentView = self.contentView;
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
