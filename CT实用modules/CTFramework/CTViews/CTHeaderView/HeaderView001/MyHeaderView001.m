//
//  MyHeaderView001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/20.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "MyHeaderView001.h"

@implementation MyHeaderView001
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - loadUI
- (void)loadUI{
    [self addSubview:self.BakImage];
    [_BakImage addSubview:self.UserImage];
    [_BakImage addSubview:self.LoginBtn];
    [_BakImage addSubview:self.PhoneBtn];
    
    UIView *view = self;
    _BakImage.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .bottomSpaceToView(view, 0);
    
    _UserImage.sd_layout
    .bottomSpaceToView(_BakImage, CONVER_VALUE(88))
    .leftSpaceToView(_BakImage, CONVER_VALUE(34))
    .widthIs(CONVER_VALUE(75))
    .heightIs(CONVER_VALUE(75));
    
    [self updateBeforeUI];
}
//登陆前
- (void)updateBeforeUI{
    _PhoneBtn.hidden = YES;
    _LoginBtn.sd_layout
    .leftSpaceToView(_UserImage, 14)
    .rightSpaceToView(_BakImage, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(16))
    .bottomSpaceToView(_BakImage, CONVER_VALUE(118));
}
//登陆后
- (void)updateAfterUI{
    _PhoneBtn.hidden = NO;
    _LoginBtn.sd_layout
    .leftSpaceToView(_UserImage, 14)
    .rightSpaceToView(_BakImage, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(16))
    .bottomSpaceToView(_BakImage, CONVER_VALUE(132));
    
    _PhoneBtn.sd_layout
    .leftSpaceToView(_UserImage, 14)
    .rightSpaceToView(_BakImage, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(16))
    .topSpaceToView(_LoginBtn, CONVER_VALUE(16));
}
- (void)updateDataUI{
    [self isUserImage];//赋值处理
    if ([UserManager isJudgeLoginUser]) {
        [self updateAfterUI];
    }else{
        [self updateBeforeUI];
    }
    [_LoginBtn updateLayout];
    [_PhoneBtn updateLayout];
}
- (void)isUserImage{
    [_UserImage sd_setImageWithURL:[NSURL URLWithString:[UserManager getUrlUserHeadImageview]] placeholderImage:[UIImage imageNamed:[UserManager getNormalUserHeadImageview]]];
    [_LoginBtn setTitle:[UserManager isUserRealName]?[UserManager isUserRealName]:@"登录/注册" forState:UIControlStateNormal];
    [_PhoneBtn setTitle:[UserManager isUsermobile]?[UserManager isUsermobile]:@"" forState:UIControlStateNormal];
}
#pragma mark - 懒加载
- (UIButton *)LoginBtn{
    if (!_LoginBtn) {
        _LoginBtn = [CTUIManagers createButtonNormalText:@"登录/注册" normalTextColor:CTColorWhite font:[UIFont systemFontOfSize:CONVER_VALUE(16)] backgroundColor:nil];
        _LoginBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _LoginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _LoginBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _LoginBtn;
}
- (UIButton *)PhoneBtn{
    if (!_PhoneBtn) {
        _PhoneBtn = [CTUIManagers createButtonNormalText:@"登录/注册" normalTextColor:CTColorWhite font:[UIFont systemFontOfSize:CONVER_VALUE(16)] backgroundColor:nil];
        _PhoneBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _PhoneBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _PhoneBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _PhoneBtn.hidden = YES;
    }
    return _PhoneBtn;
}
- (UIImageView *)BakImage{
    if (!_BakImage) {
        _BakImage = [CTUIManagers createImageViewURL:nil placeholderImage:@"MyBakImage001"];
        _BakImage.userInteractionEnabled = YES;
    }
    return _BakImage;
}
- (UIImageView *)UserImage{
    if (!_UserImage) {
        _UserImage = [CTUIManagers createImageViewURL:nil placeholderImage:@"MyUserImage001"];
        _UserImage.userInteractionEnabled = YES;
        [CTUIManagers CTImageViewRadius:_UserImage Radius:CONVER_VALUE(25)];//设置圆角
    }
    return _UserImage;
}
@end
