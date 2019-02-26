//
//  TextModelView.m
//  Travels
//
//  Created by 涛程 on 2018/9/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "PasswordView001.h"
@interface PasswordView001 ()

@property(nonatomic ,strong) UIView *view_line;
@end
@implementation PasswordView001
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.Lab_name];
    [self addSubview:self.view_line];
    [self addSubview:self.Text_content];
    
    _Lab_name.textColor = allcolorAlphasCT(51, 51, 51, 1.0);
    _Text_content.textColor = allcolorAlphasCT(51, 51, 51, 1.0);
    _view_line.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    
    if (ABOVE_IOS9) {
        _Lab_name.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Text_content.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
        
    }else{
        _Lab_name.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Text_content.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
    }
    
    UIView *view = self;
    _Lab_name.sd_layout
    .topSpaceToView(view, CONVER_VALUE(1))
    .leftSpaceToView(view, CONVER_VALUE(52))
    .rightSpaceToView(view, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(12));
    
    _Text_content.sd_layout
    .topSpaceToView(_Lab_name, CONVER_VALUE(6))
    .leftEqualToView(_Lab_name)
    .rightEqualToView(_Lab_name)
    .heightIs(CONVER_VALUE(25));
    
    _view_line.sd_layout
    .topSpaceToView(_Text_content, CONVER_VALUE(6))
    .leftEqualToView(_Lab_name)
    .rightEqualToView(_Lab_name)
    .heightIs(1);
}
#pragma mark - 懒加载
- (UILabel *)Lab_name{
    if (!_Lab_name) {
        _Lab_name = [[UILabel alloc]init];
    }
    return _Lab_name;
}
- (UIView *)view_line{
    if (!_view_line) {
        _view_line = [[UIView alloc]init];
    }
    return _view_line;
}
- (UITextField *)Text_content{
    if (!_Text_content) {
        _Text_content = [[UITextField alloc]init];
        //        _Text_ZhangHao.keyboardType = UIKeyboardTypeNumberPad;
        _Text_content.placeholder = @"密码由6-16位字母、数字组合";
        _Text_content.secureTextEntry = YES;
        _Text_content.textAlignment = NSTextAlignmentLeft;
        
    }
    return _Text_content;
}
@end
