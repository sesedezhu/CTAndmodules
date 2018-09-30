//
//  oneModelCell.m
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "oneModelCell.h"

@implementation oneModelCell
/** 初始化方法,自定义 cell时,不清楚高度,可以在这里添加子空间 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    //设置此属性，点击cell不会有灰色显示
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置此属性，是否显示系统右侧图标
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [self.contentView addSubview:self.Lab_left];
    [self.contentView addSubview:self.Btn_right];
    [self.contentView addSubview:self.Ima_right];
    [self.contentView addSubview:self.View_line];
    
    UIView *contentView = self.contentView;
    _Lab_left.sd_layout
    .topSpaceToView(contentView, CONVER_VALUE(13))
    .leftSpaceToView(contentView, CONVER_VALUE(21))
    .widthIs(CONVER_VALUE(120))
    .heightIs(CONVER_VALUE(49));
    
    _Ima_right.sd_layout
    .bottomSpaceToView(contentView, CONVER_VALUE(17))
    .rightSpaceToView(contentView, CONVER_VALUE(27))
    .widthIs(CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(15));
    
    _Btn_right.sd_layout
    .topEqualToView(_Lab_left)
    .rightSpaceToView(_Ima_right, CONVER_VALUE(13))
    .widthIs(CONVER_VALUE(120))
    .heightIs(CONVER_VALUE(49));
    
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftEqualToView(_Lab_left)
    .rightSpaceToView(contentView, CONVER_VALUE(27))
    .heightIs(1);
    
    _Lab_left.text = @"昵称";
    [_Btn_right setTitle:@"帅哥程" forState:UIControlStateNormal];
    [_Ima_right setImage:[UIImage imageNamed:@"imageRightCell"]];
    
    _Lab_left.textColor = allcolorAlphasCT(73, 75, 85, 1.0f);
    [_Btn_right setTitleColor:allcolorAlphasCT(73, 75, 85, 1.0f) forState:UIControlStateNormal];
    _View_line.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2f);
    
    _Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    _Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    
    _Lab_left.textAlignment = NSTextAlignmentLeft;
    _Btn_right.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//按钮对齐
    _Btn_right.titleLabel.textAlignment = NSTextAlignmentRight;
}
- (void)loadCellHiddenStyle:(BOOL)Ima_right{
    _Ima_right.hidden = Ima_right;
    UIView *contentView = self.contentView;
    if (Ima_right) {
        _Btn_right.sd_layout
        .topEqualToView(_Lab_left)
        .rightSpaceToView(contentView, CONVER_VALUE(29))
        .widthIs(CONVER_VALUE(120))
        .heightIs(CONVER_VALUE(49));
    }else{
        _Btn_right.sd_layout
        .topEqualToView(_Lab_left)
        .rightSpaceToView(_Ima_right, CONVER_VALUE(13))
        .widthIs(CONVER_VALUE(120))
        .heightIs(CONVER_VALUE(49));
    }
    [_Btn_right updateLayout];
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [[UILabel alloc]init];
        _Lab_left.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_left;
}
- (UIButton *)Btn_right{
    if (!_Btn_right) {
        _Btn_right = [[UIButton alloc]init];
        _Btn_right.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _Btn_right;
}
- (UIImageView *)Ima_right{
    if (!_Ima_right) {
        _Ima_right = [[UIImageView alloc]init];
    }
    return _Ima_right;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [[UIView alloc]init];
    }
    return _View_line;
}

@end
