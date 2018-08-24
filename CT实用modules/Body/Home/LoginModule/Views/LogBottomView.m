//
//  LogBottomView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LogBottomView.h"

@implementation LogBottomView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.WXBtn];
    [self addSubview:self.lineImageRight];
    [self addSubview:self.lineImageLeft];
    
    UIView *view = self;
    _lineImageLeft.sd_layout
    .centerYIs(CONVER_VALUE(15))
    .leftSpaceToView(view, CONVER_VALUE(52))
    .widthIs(CONVER_VALUE(56))
    .heightIs(1);
    
    _lineImageRight.sd_layout
    .centerYIs(CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(52))
    .widthIs(CONVER_VALUE(56))
    .heightIs(1);
    
    _WXBtn.sd_layout
    .topSpaceToView(view, 0)
    .bottomSpaceToView(view, 0)
    .leftSpaceToView(_lineImageLeft, CONVER_VALUE(23))
    .rightSpaceToView(_lineImageRight, 0);
    
    _WXBtn.imageView.sd_layout
    .topSpaceToView(_WXBtn, 0)
    .leftSpaceToView(_WXBtn, 0)
    .widthIs(CONVER_VALUE(30))
    .heightIs(CONVER_VALUE(30));
    
    _WXBtn.titleLabel.sd_layout
    .topSpaceToView(_WXBtn, 0)
    .bottomSpaceToView(_WXBtn, 0)
    .leftSpaceToView(_WXBtn.imageView, 13)
    .rightSpaceToView(_WXBtn, 0);
    
    [_WXBtn setImage:[UIImage imageNamed:@"Login_wx"] forState:UIControlStateNormal];
    _lineImageRight.image = [UIImage imageNamed:@"Login_line"];
    _lineImageLeft.image = [UIImage imageNamed:@"Login_line"];
    
    [_WXBtn setTitle:@"微信登陆" forState:UIControlStateNormal];
    [_WXBtn setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
    
    _WXBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(18)];
}
#pragma mark - 懒加载
- (UIButton *)WXBtn{
    if (!_WXBtn) {
        _WXBtn = [[UIButton alloc]init];
    }
    return _WXBtn;
}
- (UIImageView *)lineImageLeft{
    if (!_lineImageLeft) {
        _lineImageLeft = [[UIImageView alloc]init];
    }
    return _lineImageLeft;
}
- (UIImageView *)lineImageRight{
    if (!_lineImageRight) {
        _lineImageRight = [[UIImageView alloc]init];
    }
    return _lineImageRight;
}

@end
