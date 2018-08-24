//
//  LogHaedView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LogHaedView.h"

@implementation LogHaedView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.LeftBtn];
    [self addSubview:self.RightBtn];
    
    UIView *view = self;
    _LeftBtn.sd_layout
    .topSpaceToView(view, CONVER_VALUE(3))
    .leftSpaceToView(view, 0)
    .widthIs(kScreenWidth/2)
    .heightIs(CONVER_VALUE(14));
    
    _RightBtn.sd_layout
    .topSpaceToView(view, CONVER_VALUE(3))
    .rightSpaceToView(view, 0)
    .widthIs(kScreenWidth/2)
    .heightIs(CONVER_VALUE(14));
    
//    _LeftBtn.backgroundColor = [UIColor redColor];
//    _RightBtn.backgroundColor = [UIColor yellowColor];
}

#pragma mark - 懒加载
- (UIButton *)LeftBtn{
    if (!_LeftBtn) {
        _LeftBtn = [[UIButton alloc]init];
        _LeftBtn.selected = YES;
        _LeftBtn.userInteractionEnabled = NO;
        
        [_LeftBtn setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
        [_LeftBtn setTitleColor:allcolorAlphasCT(25, 25, 25, 1.0) forState:UIControlStateSelected];
        [_LeftBtn setTitle:@"手机验证码登陆" forState:UIControlStateNormal];
        
//        _LeftBtn.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
        _LeftBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:CONVER_VALUE(15)];
//        [_LeftBtn addTarget:self action:@selector(lanShouJiHao) forControlEvents:UIControlEventTouchUpInside];
    }
    return _LeftBtn;
}
- (UIButton *)RightBtn{
    if (!_RightBtn) {
        _RightBtn = [[UIButton alloc]init];
        _RightBtn.selected = NO;
        _RightBtn.userInteractionEnabled = YES;
        
        [_RightBtn setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
        [_RightBtn setTitleColor:allcolorAlphasCT(25, 25, 25, 1.0) forState:UIControlStateSelected];
        
        [_RightBtn setTitle:@"账号密码登陆" forState:UIControlStateNormal];
//        _RightBtn.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
        _RightBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:CONVER_VALUE(15)];
//        [_RightBtn addTarget:self action:@selector(lanZhangHaoMiMa) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RightBtn;
}
@end
