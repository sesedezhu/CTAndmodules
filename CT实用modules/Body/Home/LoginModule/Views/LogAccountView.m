//
//  LogAccountView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LogAccountView.h"
@interface LogAccountView ()
@property(nonatomic ,strong) UILabel *Lab_ZhangHao;
@property(nonatomic ,strong) UILabel *Lab_MiMa;
@property(nonatomic ,strong) UIButton *Btn_State;
@property(nonatomic ,strong) UIView *View_Line01;
@property(nonatomic ,strong) UIView *View_Line02;
@end
@implementation LogAccountView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.Lab_ZhangHao];
    [self addSubview:self.Lab_MiMa];
    [self addSubview:self.Btn_Warning];
    [self addSubview:self.Text_ZhangHao];
    [self addSubview:self.Text_MiMa];
    [self addSubview:self.Btn_State];
    [self addSubview:self.View_Line01];
    [self addSubview:self.View_Line02];
    
    if (ABOVE_IOS9) {
        _Lab_ZhangHao.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Lab_MiMa.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Btn_Warning.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Text_ZhangHao.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
        _Text_MiMa.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
    }else{
        _Lab_ZhangHao.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Lab_MiMa.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Btn_Warning.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Text_ZhangHao.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
        _Text_MiMa.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
    }
    
    UIView *view = self;
    _Lab_ZhangHao.sd_layout
    .topSpaceToView(view, CONVER_VALUE(3))
    .leftSpaceToView(view, CONVER_VALUE(52))
    .rightSpaceToView(view, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(12));
    
    _Text_ZhangHao.sd_layout
    .topSpaceToView(_Lab_ZhangHao, CONVER_VALUE(11))
    .leftEqualToView(_Lab_ZhangHao)
    .rightEqualToView(_Lab_ZhangHao)
    .heightIs(CONVER_VALUE(15));
    
    _View_Line01.sd_layout
    .topSpaceToView(_Text_ZhangHao, CONVER_VALUE(10))
    .leftEqualToView(_Lab_ZhangHao)
    .rightEqualToView(_Lab_ZhangHao)
    .heightIs(1);
    
    _Lab_MiMa.sd_layout
    .topSpaceToView(_View_Line01, CONVER_VALUE(26))
    .leftEqualToView(_Lab_ZhangHao)
    .rightEqualToView(_Lab_ZhangHao)
    .heightIs(CONVER_VALUE(12));
    
    _Text_MiMa.sd_layout
    .topSpaceToView(_Lab_MiMa, CONVER_VALUE(11))
    .leftEqualToView(_Lab_ZhangHao)
    .rightSpaceToView(_Btn_State, CONVER_VALUE(5))
    .heightIs(CONVER_VALUE(15));
    
    _View_Line02.sd_layout
    .topSpaceToView(_Text_MiMa, CONVER_VALUE(10))
    .leftEqualToView(_Lab_ZhangHao)
    .rightEqualToView(_Lab_ZhangHao)
    .heightIs(1);
    
    _Btn_State.sd_layout
    .bottomSpaceToView(_View_Line02, CONVER_VALUE(4))
    .rightEqualToView(_Lab_ZhangHao)
    .widthIs(CONVER_VALUE(23))
    .heightIs(CONVER_VALUE(23));
    
    _Btn_Warning.sd_layout
    .topSpaceToView(_View_Line02, CONVER_VALUE(17))
    .rightSpaceToView(view, CONVER_VALUE(50))
    .widthIs(CONVER_VALUE(80))
    .heightIs(CONVER_VALUE(12));
    
    [self WarningAndHidden:YES];//默认隐藏
}
#pragma mark - 配置方法
- (void)WarningAndHidden:(BOOL)hidden{
    if (hidden) {
        _Btn_Warning.hidden = YES;
    }else{
        _Btn_Warning.hidden = NO;
    }
}
//眼睛按钮的点击事件
- (void)ClickBtnAndState{
    if (_Btn_State.selected) {
        [self EyesAndSelected:NO];
    }else{
        [self EyesAndSelected:YES];
    }
}
- (void)EyesAndSelected:(BOOL)selected{
    if (selected) {
        _Btn_State.selected = YES;
        _Text_MiMa.secureTextEntry = NO;
    }else{
        _Btn_State.selected = NO;
        _Text_MiMa.secureTextEntry = YES;
    }
}

#pragma mark - 懒加载
- (UILabel *)Lab_ZhangHao{
    if (!_Lab_ZhangHao) {
        _Lab_ZhangHao = [[UILabel alloc]init];
        _Lab_ZhangHao.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
        _Lab_ZhangHao.text = @"账号";
        _Lab_ZhangHao.textAlignment = NSTextAlignmentLeft;
    }
    return _Lab_ZhangHao;
}
- (UILabel *)Lab_MiMa{
    if (!_Lab_MiMa) {
        _Lab_MiMa = [[UILabel alloc]init];
        
        _Lab_MiMa.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
        _Lab_MiMa.text = @"密码";
        _Lab_MiMa.textAlignment = NSTextAlignmentLeft;
    }
    return _Lab_MiMa;
}
- (UIButton *)Btn_Warning{
    if (!_Btn_Warning) {
        _Btn_Warning = [[UIButton alloc]init];
        
        [_Btn_Warning setTitleColor: allcolorAlphasCT(255, 0, 0, 1.0) forState:UIControlStateNormal];
        [_Btn_Warning setTitle:@"忘记密码？" forState:UIControlStateNormal];
        
        _Btn_Warning.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//按钮对齐
    }
    return _Btn_Warning;
}
- (UIButton *)Btn_State{
    if (!_Btn_State) {
        _Btn_State = [[UIButton alloc]init];
        [_Btn_State setImage:[UIImage imageNamed:@"Login_MimaSelected"] forState:UIControlStateNormal];
        [_Btn_State setImage:[UIImage imageNamed:@"Login_MimaDefault"] forState:UIControlStateSelected];
        [_Btn_State addTarget:self action:@selector(ClickBtnAndState) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Btn_State;
}
- (UITextField *)Text_ZhangHao{
    if (!_Text_ZhangHao) {
        _Text_ZhangHao = [[UITextField alloc]init];
        _Text_ZhangHao.placeholder = @"请输入账号";
        _Text_ZhangHao.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
    }
    return _Text_ZhangHao;
}
- (UITextField *)Text_MiMa{
    if (!_Text_MiMa) {
        _Text_MiMa = [[UITextField alloc]init];
        _Text_MiMa.placeholder = @"请输入密码";
        _Text_MiMa.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
        
        _Text_MiMa.returnKeyType = UIReturnKeyDone;//更改键盘右下角返回样式
        _Text_MiMa.secureTextEntry = YES;
    }
    return _Text_MiMa;
}
- (UIView *)View_Line01{
    if (!_View_Line01) {
        _View_Line01 = [[UIView alloc]init];
        _View_Line01.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    }
    return _View_Line01;
}
- (UIView *)View_Line02{
    if (!_View_Line02) {
        _View_Line02 = [[UIView alloc]init];
        _View_Line02.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    }
    return _View_Line02;
}
@end
