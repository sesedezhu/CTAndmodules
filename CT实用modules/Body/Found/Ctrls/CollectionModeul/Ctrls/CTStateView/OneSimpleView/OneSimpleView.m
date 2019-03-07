//
//  OneSimpleView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/13.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "OneSimpleView.h"
@interface OneSimpleView()

@property (nonatomic, strong) UIImageView *imaView;       //背景图片
@property (nonatomic, strong) UIImageView *TitleImaView;  //标题文字图片

@end
@implementation OneSimpleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.imaView];
    [_imaView addSubview:self.TitleImaView];
    [_imaView addSubview:self.ContentLab];
    [_imaView addSubview:self.btn];
    
    UIView *view = self;
    _imaView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .bottomSpaceToView(view, 0)
    .rightSpaceToView(view, 0);
    
    _TitleImaView.sd_layout
    .topSpaceToView(_imaView, CONVER_VALUE(44))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(191))
    .heightIs(CONVER_VALUE(26));
    
    _btn.sd_layout
    .centerXIs(kScreenWidth/2)
    .bottomSpaceToView(_imaView, CONVER_VALUE(80))
    .widthIs(CONVER_VALUE(252))
    .heightIs(CONVER_VALUE(50));
    
    _ContentLab.sd_layout
    .topSpaceToView(_TitleImaView, CONVER_VALUE(26))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(305))
    .autoHeightRatio(0);
    [_ContentLab setMaxNumberOfLinesToShow:20];//自适应高度的时候限制控件最大行数
    
    [_imaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"OneSimple_background"]];
    [_TitleImaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"OneSimple_title"]];
    [_btn setBackgroundImage:[UIImage imageNamed:@"OneSimple_btn_background"] forState:UIControlStateNormal];
    [_btn setTitle:@"匹配当地玩咖" forState:UIControlStateNormal];
    _ContentLab.text = @"只有当地玩咖才能带您领略最本土风情";
    
}

#pragma mark - 懒加载
- (UIImageView *)imaView{
    if (!_imaView) {
        _imaView = [[UIImageView alloc]init];
        _imaView.userInteractionEnabled = YES;
    }
    return _imaView;
}
- (UIImageView *)TitleImaView{
    if (!_TitleImaView) {
        _TitleImaView = [[UIImageView alloc]init];
    }
    return _TitleImaView;
}
- (UILabel *)ContentLab{
    if (!_ContentLab) {
        _ContentLab = [[UILabel alloc]init];
//        _ContentLabel.numberOfLines = 0;
        _ContentLab.textColor = CTColorWhite;
        _ContentLab.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
       
    }
    return _ContentLab;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]init];
        [_btn setTitleColor:CTColorWhite forState:UIControlStateNormal];
        _btn.titleLabel.font    = [UIFont systemFontOfSize: CONVER_VALUE(15)];
    }
    return _btn;
}
@end
