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
@property(nonatomic ,strong) UITextField *Text_ZhangHao;
@property(nonatomic ,strong) UITextField *Text_MiMa;
@property(nonatomic ,strong) UILabel *Lab_Warning;
@property(nonatomic ,strong) UIImageView *Image_State;
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
    [self addSubview:self.Lab_Warning];
    [self addSubview:self.Text_ZhangHao];
    [self addSubview:self.Text_MiMa];
    [self addSubview:self.Image_State];
    [self addSubview:self.View_Line01];
    [self addSubview:self.View_Line02];
    
    UIView *view = self;
}
#pragma mark - 懒加载
- (UILabel *)Lab_ZhangHao{
    if (!_Lab_ZhangHao) {
        _Lab_ZhangHao = [[UILabel alloc]init];
    }
    return _Lab_ZhangHao;
}
- (UILabel *)Lab_MiMa{
    if (!_Lab_MiMa) {
        _Lab_MiMa = [[UILabel alloc]init];
    }
    return _Lab_MiMa;
}
- (UILabel *)Lab_Warning{
    if (!_Lab_Warning) {
        _Lab_Warning = [[UILabel alloc]init];
    }
    return _Lab_Warning;
}
- (UIImageView *)Image_State{
    if (!_Image_State) {
        _Image_State = [[UIImageView alloc]init];
    }
    return _Image_State;
}
- (UITextField *)Text_ZhangHao{
    if (!_Text_ZhangHao) {
        _Text_ZhangHao = [[UITextField alloc]init];
        _Text_ZhangHao.placeholder = @"请输入账号";
        _Text_ZhangHao.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
    }
    return _Text_ZhangHao;
}
- (UITextField *)Text_MiMa{
    if (!_Text_MiMa) {
        _Text_MiMa = [[UITextField alloc]init];
        _Text_MiMa.placeholder = @"请输入密码";
        _Text_MiMa.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];

        _Text_MiMa.returnKeyType = UIReturnKeyDone;//更改键盘右下角返回样式
        _Text_MiMa.secureTextEntry = YES;
    }
    return _Text_MiMa;
}
- (UIView *)View_Line01{
    if (!_View_Line01) {
        _View_Line01 = [[UIView alloc]init];
    }
    return _View_Line01;
}
- (UIView *)View_Line02{
    if (!_View_Line02) {
        _View_Line02 = [[UIView alloc]init];
    }
    return _View_Line02;
}
@end
