//
//  ZYShareCanceView.m
//  Travels
//
//  Created by 涛程 on 2018/11/18.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "ZYShareCanceView.h"

@implementation ZYShareCanceView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.cancelLogBtn];
    [self addSubview:self.cancelLabel];
    [self addSubview:self.cancelButton];
    
    // 取消按钮
    self.cancelButton.frame = CGRectMake(kScreenWidth-CONVER_VALUE(80), 14, CONVER_VALUE(80), 34);
    //确认登录按钮
    _cancelLogBtn.sd_layout
    .topEqualToView(_cancelButton)
    .rightSpaceToView(_cancelButton, CONVER_VALUE(15))
    .widthIs(CONVER_VALUE(108))
    .heightIs(CONVER_VALUE(34));
    //取消文案
    _cancelLabel.sd_layout
    .topEqualToView(_cancelButton)
    .leftSpaceToView(self, 31)
    .rightSpaceToView(_cancelLogBtn, 5)
    .heightIs(CONVER_VALUE(34));
}

- (UILabel *)cancelLabel{
    if (!_cancelLabel) {
        _cancelLabel = [[UILabel alloc]init];
        _cancelLabel.text = @"当前未登录，分享无收益";
        _cancelLabel.textColor = allcolorAlphasCT(39, 38, 38, 1.0);
        _cancelLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _cancelLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _cancelLabel;
}
- (UIButton *)cancelLogBtn{
    if (!_cancelLogBtn) {
        _cancelLogBtn = [[UIButton alloc]init];
        //按钮变圆
        _cancelLogBtn.layer.cornerRadius = CONVER_VALUE(9);
        _cancelLogBtn.clipsToBounds = YES;
        //绘画按钮边界线
        [_cancelLogBtn.layer setBorderColor:[UIColor redColor].CGColor];
        [_cancelLogBtn.layer setBorderWidth:1];
        [_cancelLogBtn.layer setMasksToBounds:YES];
        [_cancelLogBtn setTitle:@"去登录" forState:UIControlStateNormal];
        _cancelLogBtn.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
        [_cancelLogBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
       
    }
    return _cancelLogBtn;
}
- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        _cancelButton.backgroundColor = [UIColor whiteColor];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:allcolorAlphasCT(0, 0, 0, 1.0) forState:UIControlStateNormal];
        if (ABOVE_IOS9) {
            _cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:CONVER_VALUE(15)];
        }else{
            _cancelButton.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
        }
    }
    return _cancelButton;
}
@end
