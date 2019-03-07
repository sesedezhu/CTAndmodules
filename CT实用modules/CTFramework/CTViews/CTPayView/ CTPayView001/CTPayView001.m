//
//  CTPayView001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/28.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CTPayView001.h"

@implementation CTPayView001
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - loadUI
- (void)loadUI{
    self.backgroundColor = CTColorWhite;
    [self addSubview:self.PayImage];
    [self addSubview:self.LabResults];
    [self addSubview:self.LabWarning];
    [self addSubview:self.LeftBtn];
    [self addSubview:self.RightBtn];
    
    UIView *view = self;
    _PayImage.sd_layout
    .topSpaceToView(view, CONVER_VALUE(50))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(70))
    .heightIs(CONVER_VALUE(70));
    
    _LabResults.sd_layout
    .topSpaceToView(_PayImage, CONVER_VALUE(15))
    .leftSpaceToView(view, CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(17));
    
    _LabWarning.sd_layout
    .topSpaceToView(_LabResults, CONVER_VALUE(15))
    .leftEqualToView(_LabResults)
    .rightEqualToView(_LabResults)
    .heightIs(CONVER_VALUE(13));
    
    _LeftBtn.sd_layout
    .topSpaceToView(_LabWarning, CONVER_VALUE(27))
    .leftSpaceToView(view, CONVER_VALUE(59))
    .widthIs(CONVER_VALUE(109))
    .heightIs(CONVER_VALUE(41));
    
    _RightBtn.sd_layout
    .topEqualToView(_LeftBtn)
    .leftSpaceToView(_LeftBtn, CONVER_VALUE(40))
    .widthIs(CONVER_VALUE(109))
    .heightIs(CONVER_VALUE(41));
}
#pragma mark - 懒加载
- (UILabel *)LabResults{
    if (!_LabResults) {
        _LabResults = [CTUIManagers createLabelText:@"支付结果" textColor:CTColorBlack font:[UIFont systemFontOfSize:CONVER_VALUE(18)] textAlignment:NSTextAlignmentCenter backgroundColor:CTColorClear];
    }
    return _LabResults;
}
- (UILabel *)LabWarning{
    if (!_LabWarning) {
        _LabWarning = [CTUIManagers createLabelText:@"文案告知" textColor:allcolorAlphasCT(145, 145, 145, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentCenter backgroundColor:CTColorClear];
    }
    return _LabWarning;
}
- (UIImageView *)PayImage{
    if (!_PayImage) {
        _PayImage = [CTUIManagers createImageViewURL:nil placeholderImage:nil];
        _PayImage.userInteractionEnabled = YES;
        [CTUIManagers CTImageViewRadius:_PayImage Radius:CONVER_VALUE(35)];//设置圆角
    }
    return _PayImage;
}
- (UIButton *)LeftBtn{
    if (!_LeftBtn) {
        _LeftBtn = [CTUIManagers createButtonNormalText:@"" normalTextColor:CTColorBlack font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:allcolorAlphasCT(245, 245, 245, 1.0)];
        _LeftBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _LeftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _LeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _LeftBtn;
}
- (UIButton *)RightBtn{
    if (!_RightBtn) {
        _RightBtn = [CTUIManagers createButtonNormalText:@"" normalTextColor:CTColorBlack font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:allcolorAlphasCT(245, 245, 245, 1.0)];
        _RightBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _RightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _RightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _RightBtn;
}
@end
