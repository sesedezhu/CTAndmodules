//
//  NetworkError.m
//  HaiBa
//
//  Created by 涛程 on 2017/7/26.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "NetworkError.h"

@implementation NetworkError

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadDaiUI];
    }
    return self;
}

- (void)loadDaiUI{
    //设置颜色
    self.backgroundColor = CTColorGroupTableViewBackground;
    [self.ima setImage:[UIImage imageNamed:@"NetError2"]];
    self.Lab_Title.textColor = [UIColor grayColor];
//    self.Btn_Rob.backgroundColor = allcolor;
    [_Btn_Rob setTitleColor:CTColorWhite forState:UIControlStateNormal];
    
    //添加控件
    [self addSubview:_ima];
    [self addSubview:_Lab_Title];
    [self addSubview:_Btn_Rob];
    UIView *view = self;
    
    //设置尺寸
    _ima.sd_layout
    .topSpaceToView(view, kScreenHeight/2 - TRANS_VALUE(97)-5)
    .leftSpaceToView(view, kScreenWidth/2 - TRANS_VALUE(67))
    .widthIs(TRANS_VALUE(134))
    .heightIs(TRANS_VALUE(134));
    
    _Lab_Title.sd_layout
    .topSpaceToView(_ima, 5)
    .leftSpaceToView(view, 20)
    .rightSpaceToView(view, 20)
    .heightIs(TRANS_VALUE(30));
    
    _Btn_Rob.sd_layout
    .topSpaceToView(_Lab_Title, 5)
    .leftEqualToView(_ima)
    .widthRatioToView(_ima, 1)
    .heightIs(TRANS_VALUE(30));
    
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
        _Lab_Title.text = @"加载错误";
        _Lab_Title.textAlignment = NSTextAlignmentCenter;
        _Lab_Title.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_Title;
}
- (UIButton *)Btn_Rob{
    if (!_Btn_Rob) {
        _Btn_Rob = [[UIButton alloc]init];
        [_Btn_Rob setTitle:@"点击刷新" forState:UIControlStateNormal];
        _Btn_Rob.layer.cornerRadius = TRANS_VALUE(15);
        _Btn_Rob.clipsToBounds = YES;
    }
    
    return _Btn_Rob;
}
@end
