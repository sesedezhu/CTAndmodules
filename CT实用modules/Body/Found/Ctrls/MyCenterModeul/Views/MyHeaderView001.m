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
    
    _LoginBtn.sd_layout
    .leftSpaceToView(_UserImage, 14)
    .rightSpaceToView(_BakImage, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(16))
    .bottomSpaceToView(_BakImage, CONVER_VALUE(118));
    
    [self isUserImage];
}
- (void)isUserImage{
    [_UserImage sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"MyUserImage001"]];
}
#pragma mark - 懒加载
- (UIButton *)LoginBtn{
    if (!_LoginBtn) {
        _LoginBtn = [CTUICtrlsManagers createButtonNormalText:@"登录/注册" normalTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:CONVER_VALUE(16)] backgroundColor:nil];
        _LoginBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _LoginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _LoginBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _LoginBtn;
}
- (UIImageView *)BakImage{
    if (!_BakImage) {
        _BakImage = [CTUICtrlsManagers createImageViewURL:nil placeholderImage:@"MyBakImage001"];
        _BakImage.userInteractionEnabled = YES;
    }
    return _BakImage;
}
- (UIImageView *)UserImage{
    if (!_UserImage) {
        _UserImage = [CTUICtrlsManagers createImageViewURL:nil placeholderImage:@"MyUserImage001"];
        _UserImage.userInteractionEnabled = YES;
        [CTUICtrlsManagers CTImageViewRadius:_UserImage Radius:CONVER_VALUE(25)];//设置圆角
    }
    return _UserImage;
}
@end
