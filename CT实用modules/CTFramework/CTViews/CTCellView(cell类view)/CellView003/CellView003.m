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
    //    self.selectionStyle = UITableViewCellSelectionStyleNone;//点击不会有选中效果
    //设置此属性，是否显示系统右侧图标
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [self addSubview:self.Lab_left];
    [self addSubview:self.Ima_left];
    [self addSubview:self.Btn_right];
    [self addSubview:self.Ima_right];
    [self addSubview:self.View_line];
    
}
- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    
    // 确定子控件的frame（这里得到的self的frame/bounds才是准确的）
//    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, LeftSpaceToCTView)
    .rightSpaceToView(contentView, RightSpaceToCTView)
    .heightIs(1);
    
    _Ima_left.sd_layout
    .leftEqualToView(_View_line)
    .centerYIs(height/2)
    .widthIs(CONVER_VALUE(21))
    .heightIs(CONVER_VALUE(18));
    
    _Lab_left.sd_layout
    .leftSpaceToView(_Ima_left, 15)
    .centerYIs(height/2)
    .widthIs(CONVER_VALUE(120))
    .heightIs(CONVER_VALUE(49));
    
    _Ima_right.sd_layout
    .centerYIs(height/2)
    .rightEqualToView(_View_line)
    .widthIs(CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(15));
    
    if (_Ima_right.hidden) {
        _Btn_right.sd_layout
        .bottomEqualToView(_Lab_left)
        .rightEqualToView(_View_line)
        .leftSpaceToView(_Lab_left, 8)
        .heightIs(CONVER_VALUE(49));
    }else{
        _Btn_right.sd_layout
        .bottomEqualToView(_Lab_left)
        .rightSpaceToView(_Ima_right, CONVER_VALUE(15))
        .leftSpaceToView(_Lab_left, 8)
        .heightIs(CONVER_VALUE(49));
    }
    _Btn_right.titleLabel.sd_layout
    .topSpaceToView(_Btn_right, 0)
    .leftSpaceToView(_Btn_right, 0)
    .bottomSpaceToView(_Btn_right, 0)
    .rightSpaceToView(_Btn_right, 0);
}
- (void)loadCellHiddenStyle:(BOOL)Ima_right{
    _Ima_right.hidden = Ima_right;
    [_Btn_right updateLayout];
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [CTUIManagers createLabelText:@"联系我们"];
        _Lab_left.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_left;
}
- (UIButton *)Btn_right{
    if (!_Btn_right) {
        _Btn_right = [CTUIManagers createButtonNormalText:@"帅哥程" normalTextColor:CTColorGrayaAndBlack font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:CTColorClear];;
        _Btn_right.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn_right.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//按钮对齐
        _Btn_right.titleLabel.textAlignment = NSTextAlignmentRight;
        _Btn_right.hidden = YES;
    }
    return _Btn_right;
}
- (UIImageView *)Ima_right{
    if (!_Ima_right) {
        _Ima_right = [CTUIManagers createImageViewURL:nil placeholderImage:@"imageRightCell"];
        _Ima_right.hidden = YES;
    }
    return _Ima_right;
}
- (UIImageView *)Ima_left{
    if (!_Ima_left) {
        _Ima_left = [CTUIManagers createImageViewURL:nil placeholderImage:@"Cell003Left"];
    }
    return _Ima_left;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.backgroundColor = CTColorGroupTableViewBackground;
        _View_line.hidden = YES;
    }
    return _View_line;
}
@end
