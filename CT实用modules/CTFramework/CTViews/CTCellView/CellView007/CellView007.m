//
//  CellView007.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/7.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView007.h"

@implementation CellView007
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    
    [self addSubview:self.View_line];
    [self addSubview:self.Lab_title];
    [self addSubview:self.Lab_date];
    [self addSubview:self.Lab_content];
    [self addSubview:self.Lab_numberText];
    [self addSubview:self.Lab_number];
    [self addSubview:self.Ima_left];
    
}
- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, LeftSpaceToCTView)
    .rightSpaceToView(contentView, RightSpaceToCTView)
    .heightIs(1);
    
    _Ima_left.sd_layout
    .bottomSpaceToView(_View_line, CONVER_VALUE(30))
    .leftEqualToView(_View_line)
    .heightIs(CONVER_VALUE(80))
    .widthIs(CONVER_VALUE(103));
    
    _Lab_date.sd_layout
    .topEqualToView(_Ima_left)
    .leftSpaceToView(_Ima_left, 15)
    .rightEqualToView(_View_line)
    .heightIs(CONVER_VALUE(13));
    
    _Lab_content.sd_layout
    .topSpaceToView(_Lab_date, CONVER_VALUE(21))
    .leftEqualToView(_Lab_date)
    .rightEqualToView(_Lab_date)
    .heightIs(CONVER_VALUE(13));
    
    _Lab_numberText.sd_layout
    .bottomEqualToView(_Ima_left)
    .leftEqualToView(_Lab_date)
    .widthIs(CONVER_VALUE(46))
    .heightIs(CONVER_VALUE(14));
    
    _Lab_number.sd_layout
    .topEqualToView(_Lab_numberText)
    .bottomEqualToView(_Lab_numberText)
    .leftSpaceToView(_Lab_numberText, 1)
    .rightEqualToView(_Lab_date);
    
    _Lab_title.sd_layout
    .bottomSpaceToView(_Ima_left, CONVER_VALUE(30))
    .leftEqualToView(_View_line)
    .rightEqualToView(_View_line)
    .autoHeightRatio(0);
    [_Lab_title setMaxNumberOfLinesToShow:2];//自适应高度的时候限制控件最大行数
    
    //自动适配cell高度;自动布局
    [self setupAutoHeightWithBottomView:_View_line bottomMargin:0];
}

#pragma mark - 懒加载
- (UILabel *)Lab_title{
    if (!_Lab_title) {
        _Lab_title = [CTUIManagers createLabelText:@"xxxxxxxxx" textColor:allcolorAlphasCT(51, 51, 51, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(15)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
    }
    return _Lab_title;
}
- (UILabel *)Lab_date{
    if (!_Lab_date) {
        _Lab_date = [CTUIManagers createLabelText:@"xxxx-xx-xx 至 xxxx-xx-xx  x人  x晚" textColor:allcolorAlphasCT(51, 51, 51, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
    }
    return _Lab_date;
}
- (UILabel *)Lab_content{
    if (!_Lab_content) {
        _Lab_content = [CTUIManagers createLabelText:@"连住x晚 享x折" textColor:allcolorAlphasCT(241, 96, 39, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
    }
    return _Lab_content;
}
- (UILabel *)Lab_numberText{
    if (!_Lab_numberText) {
        _Lab_numberText = [CTUIManagers createLabelText:@"套餐:" textColor:allcolorAlphasCT(51, 51, 51, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(15)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
    }
    return _Lab_numberText;
}
- (UILabel *)Lab_number{
    if (!_Lab_number) {
        _Lab_number = [CTUIManagers createLabelText:@"x" textColor:allcolorAlphasCT(241, 96, 39, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
    }
    return _Lab_number;
}
- (UIImageView *)Ima_left{
    if (!_Ima_left) {
        _Ima_left = [CTUIManagers createImageViewURL:nil placeholderImage:@"Cell005Left"];
    }
    return _Ima_left;
}
@end
