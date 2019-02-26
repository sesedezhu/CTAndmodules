//
//  CellView001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/26.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView001.h"

@implementation CellView001
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
    [self addSubview:self.Btn_right];
    [self addSubview:self.Ima_right];
    [self addSubview:self.View_line];
    
    UIView *contentView = self;
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
    UIView *contentView = self;
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
