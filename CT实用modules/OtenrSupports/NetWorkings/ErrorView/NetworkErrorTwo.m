//
//  NetworkErrorTwo.m
//  HaiBa
//
//  Created by 谭晓强 on 2017/10/16.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "NetworkErrorTwo.h"

@implementation NetworkErrorTwo

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadDaiUI];
    }
    return self;
}

- (void)loadDaiUI{

    //设置颜色
    self.backgroundColor = CTColorWhite;
    [self.ima setImage:[UIImage imageNamed:@"NetError2"]];
    self.Lab_Title.textColor = [UIColor grayColor];
//    self.Btn_Rob.backgroundColor = allcolor;
    self.detailLabel.textColor = [UIColor grayColor];
    [_Btn_Rob setTitleColor:CTColorWhite forState:UIControlStateNormal];
    
    //添加控件
    [self addSubview:_ima];
    [self addSubview:_Lab_Title];
    [self addSubview:_Btn_Rob];
    [self addSubview:_detailLabel];
    UIView *view = self;
    
    //设置尺寸
    _ima.sd_layout
    .topSpaceToView(view, kScreenHeight/2 - CONVER_VALUE(150)-65)
    .leftSpaceToView(view, kScreenWidth/2 - CONVER_VALUE(67))
    .widthIs(CONVER_VALUE(134))
    .heightIs(CONVER_VALUE(134));
    
    _Lab_Title.sd_layout
    .topSpaceToView(_ima, 5)
    .leftSpaceToView(view, 20)
    .rightSpaceToView(view, 20)
    .heightIs(CONVER_VALUE(30));
    
    _detailLabel.sd_layout
    .topSpaceToView(_Lab_Title, 5)
    .leftSpaceToView(view, 20)
    .rightSpaceToView(view, 20)
    .heightIs(CONVER_VALUE(30));
    
    _Btn_Rob.sd_layout
    .topSpaceToView(_detailLabel, 15)
    .leftEqualToView(_ima)
    .widthRatioToView(_ima, 1)
    .heightIs(CONVER_VALUE(30));

}
- (void)layoutSubviews{
    /* 为子控件添加fram */
    [super layoutSubviews];
    //    self.backgroundColor = allcolor;
    //使用自动布局在这里面写貌似无效
    
}
- (UIImageView *)ima{
    if (!_ima) {
        _ima = [[UIImageView alloc]init];
    }
    return _ima;
}
- (UILabel *)Lab_Title{
    if (!_Lab_Title) {
        _Lab_Title = [[UILabel alloc]init];
        _Lab_Title.text = @"";
        _Lab_Title.textAlignment = NSTextAlignmentCenter;
        _Lab_Title.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_Title;
}
-(UILabel*)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _detailLabel;
}
- (UIButton *)Btn_Rob{
    if (!_Btn_Rob) {
        _Btn_Rob = [[UIButton alloc]init];
        [_Btn_Rob setTitle:@"重试" forState:UIControlStateNormal];
        _Btn_Rob.layer.cornerRadius = CONVER_VALUE(15);
        _Btn_Rob.clipsToBounds = YES;
    }
    
    return _Btn_Rob;
}

@end
