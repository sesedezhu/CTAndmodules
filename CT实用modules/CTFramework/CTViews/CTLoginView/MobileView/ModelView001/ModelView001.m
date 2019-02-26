//
//  TextModelView2.m
//  CT实用modules
//
//  Created by chengtao on 2019/2/10.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "ModelView001.h"
@interface ModelView001 ()

@property(nonatomic ,strong) UIView *view_line;
@end
@implementation ModelView001
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
    
    [self addSubview:self.letImageView];
    [self addSubview:self.view_line];
    [self addSubview:self.Text_content];
    
    UIView *view = self;
    _letImageView.sd_layout
    .topSpaceToView(view, CONVER_VALUE(30))
    .leftSpaceToView(view, CONVER_VALUE(14))
    .widthIs(CONVER_VALUE(18))
    .heightIs(CONVER_VALUE(27));
    
    _Text_content.sd_layout
    .topEqualToView(_letImageView)
    .leftSpaceToView(_letImageView, CONVER_VALUE(12))
    .rightEqualToView(view)
    .heightIs(CONVER_VALUE(27));
    
    _view_line.sd_layout
    .topSpaceToView(_letImageView, CONVER_VALUE(20))
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .heightIs(1);
}
#pragma mark - 懒加载
- (UIImageView *)letImageView{
    if (!_letImageView) {
        _letImageView = [CTUIManagers createImageViewURL:nil placeholderImage:@"shouji2"];
    }
    return _letImageView;
}
- (UIView *)view_line{
    if (!_view_line) {
        _view_line = [CTUIManagers createView];
        _view_line.backgroundColor = allcolorAlphasCT(225, 225, 225, 1.0);
    }
    return _view_line;
}
- (UITextField *)Text_content{
    if (!_Text_content) {
        _Text_content = [CTUIManagers createTextFieldPlaceholder:@"您的手机号码" keyboardType:UIKeyboardTypeDefault backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentLeft];
        _Text_content.textColor = allcolorAlphasCT(145, 145, 145, 1.0);
        //        _Text_ZhangHao.keyboardType = UIKeyboardTypeNumberPad;
//        _Text_content.placeholder = @"密码由6-16位字母、数字组合";
//        _Text_content.secureTextEntry = YES;
//        _Text_content.textAlignment = NSTextAlignmentLeft;
        
    }
    return _Text_content;
}

@end
