//
//  ShareView01ct.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/17.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "ShareView01ct.h"
#import "ZYShareCanceView.h"
@interface ShareView01ct ()
@property(nonatomic ,strong) UILabel *Lab_Title;       //标题
@property(nonatomic ,strong) UIButton *Btn_Friend;       //朋友
@property(nonatomic ,strong) UIButton *Btn_Circle;       //朋友圈
@property (nonatomic, strong) ZYShareCanceView *cancelView;
@end
@implementation ShareView01ct
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.Lab_Title];
    [self addSubview:self.Btn_Friend];
    [self addSubview:self.Btn_Circle];
    [self addSubview:self.cancelView];
    self.isSheetViewBool = NO;
    
    UIView *view = self;
    _Lab_Title.sd_layout
    .topSpaceToView(view, 0)
    .centerXIs(kScreenWidth/2)
    .leftSpaceToView(view, CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(30));
    
    _Btn_Friend.sd_layout
    .topSpaceToView(_Lab_Title, 15)
    .leftSpaceToView(view, 31)
    .widthIs(CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(80));
    
    _Btn_Circle.sd_layout
    .topSpaceToView(_Lab_Title, 15)
    .leftSpaceToView(_Btn_Friend, CONVER_VALUE(10))
    .widthIs(CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(80));
    
    _cancelView.sd_layout
    .bottomSpaceToView(view, CONVER_VALUE(30))
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .heightIs(CONVER_VALUE(30));
    
    
    _Btn_Friend.imageView.sd_layout
    .topSpaceToView(_Btn_Friend, 0)
    .leftSpaceToView(_Btn_Friend, 0)
    .rightSpaceToView(_Btn_Friend, 0)
    .heightIs(CONVER_VALUE(50));
    
    _Btn_Friend.titleLabel.sd_layout
    .topSpaceToView(_Btn_Friend.imageView, 0)
    .leftEqualToView(_Btn_Friend.imageView)
    .rightEqualToView(_Btn_Friend.imageView)
    .heightIs(CONVER_VALUE(20));
    
    _Btn_Circle.imageView.sd_layout
    .topSpaceToView(_Btn_Circle, 0)
    .leftSpaceToView(_Btn_Circle, 0)
    .rightSpaceToView(_Btn_Circle, 0)
    .heightIs(CONVER_VALUE(50));
    
    _Btn_Circle.titleLabel.sd_layout
    .topSpaceToView(_Btn_Circle.imageView, 0)
    .leftEqualToView(_Btn_Circle.imageView)
    .rightEqualToView(_Btn_Circle.imageView)
    .heightIs(CONVER_VALUE(20));
    
    
}
- (void)setIsSheetViewBool:(BOOL)isSheetViewBool{
    if (isSheetViewBool) {
        //确认登录按钮
        _cancelView.cancelLogBtn.hidden = YES;
        //取消文案
        _cancelView.cancelLabel.sd_layout
        .topEqualToView(_cancelView.cancelButton)
        .leftSpaceToView(_cancelView, 31)
        .rightSpaceToView(_cancelView.cancelButton, 5)
        .heightIs(CONVER_VALUE(34));
        
        _cancelView.cancelLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
        [_cancelView.cancelLabel updateLayout];
    }else{
        _cancelView.cancelLogBtn.hidden = NO;
        //确认登录按钮
        _cancelView.cancelLogBtn.sd_layout
        .topEqualToView(_cancelView.cancelButton)
        .rightSpaceToView(_cancelView.cancelButton, CONVER_VALUE(15))
        .widthIs(CONVER_VALUE(108))
        .heightIs(CONVER_VALUE(34));
        //取消文案
        _cancelView.cancelLabel.sd_layout
        .topEqualToView(_cancelView.cancelButton)
        .leftSpaceToView(_cancelView, 31)
        .rightSpaceToView(_cancelView.cancelLogBtn, 5)
        .heightIs(CONVER_VALUE(34));
        
        _cancelView.cancelLabel.text = @"当前未登录，分享无收益";
        _cancelView.cancelLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        [_cancelView.cancelLogBtn updateLayout];
        [_cancelView.cancelLabel updateLayout];
    }
}
//取消页面文案显示判断
- (void)setIsSheetCancelLabel:(BOOL)isSheetCancelLabel{
    _cancelView.cancelLabel.hidden = isSheetCancelLabel;
}
//取消文案赋值
- (void)setCancelLabelStr:(NSString *)CancelLabelStr{
    _cancelView.cancelLabel.text = CancelLabelStr;
    [CTTextTool fuwenbenLabel:_cancelView.cancelLabel FontNumber:CONVER_VALUE(14) AndRange:NSMakeRange(12, _cancelView.cancelLabel.text.length-12) AndColor:[UIColor redColor]];
}
- (UIButton *)cancelButton
{
    return self.cancelView.cancelButton;
}
#pragma mark - 懒加载
- (UILabel *)Lab_Title{
    if (!_Lab_Title) {
        _Lab_Title = [CTUIManagers createLabelText:@"分享"];
        _Lab_Title.textColor = [UIColor darkGrayColor];
        _Lab_Title.textAlignment = NSTextAlignmentCenter;
        if (ABOVE_IOS9) {
            _Lab_Title.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(15)];
        }else{
            _Lab_Title.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
        }
    }
    return _Lab_Title;
}
- (UIButton *)Btn_Friend{
    if (!_Btn_Friend) {
        _Btn_Friend = [CTUIManagers createButtonNormalText:@"发送给朋友" normalTextColor:[UIColor grayColor] font:nil backgroundColor:nil];
        [_Btn_Friend setImage:[UIImage imageNamed:@"Action_Share"] forState:UIControlStateNormal];
        _Btn_Friend.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _Btn_Friend;
}
- (UIButton *)Btn_Circle{
    if (!_Btn_Circle) {
        _Btn_Circle = [CTUIManagers createButtonNormalText:@"分享到朋友圈" normalTextColor:[UIColor grayColor] font:nil backgroundColor:nil];
        [_Btn_Circle setImage:[UIImage imageNamed:@"Action_Moments"] forState:UIControlStateNormal];
        _Btn_Circle.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _Btn_Circle;
}
- (ZYShareCanceView *)cancelView{
    if (!_cancelView) {
        _cancelView = [[ZYShareCanceView alloc]init];
        _cancelView.backgroundColor = [UIColor whiteColor];
//        [_cancelView.cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
//        [_cancelView.cancelLogBtn addTarget:self action:@selector(SharepushLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelView;
}
//- (void)cancelButtonClick
//{
//    if (self.cancelBlock) {
//        self.cancelBlock();
//    }
//}
//- (void)SharepushLogin{
//    [self cancelButtonClick];
//
//    if ([self isUserPlistsAndLoginUI]) {
//        return ;
//    }
//}
@end
