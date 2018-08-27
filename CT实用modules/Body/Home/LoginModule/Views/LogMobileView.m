//
//  LogMobileView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LogMobileView.h"
@interface LogMobileView ()
@property(nonatomic ,strong) UILabel *Lab_Mobile;
@property(nonatomic ,strong) UILabel *Lab_Check;
@property(nonatomic ,strong) UITextField *Text_Mobile;
@property(nonatomic ,strong) UITextField *Text_Check;
@property(nonatomic ,strong) UILabel *Lab_Warning;
@property(nonatomic ,strong) UIButton *Btn_State;
@property(nonatomic ,strong) UIView *View_Line01;
@property(nonatomic ,strong) UIView *View_Line02;

//定时器
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end
@implementation LogMobileView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.Lab_Mobile];
    [self addSubview:self.Lab_Check];
    [self addSubview:self.Lab_Warning];
    [self addSubview:self.Text_Mobile];
    [self addSubview:self.Text_Check];
    [self addSubview:self.Btn_State];
    [self addSubview:self.View_Line01];
    [self addSubview:self.View_Line02];
    
    UIView *view = self;
    _Lab_Mobile.sd_layout
    .topSpaceToView(view, CONVER_VALUE(3))
    .leftSpaceToView(view, CONVER_VALUE(52))
    .rightSpaceToView(view, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(12));
    
    _Text_Mobile.sd_layout
    .topSpaceToView(_Lab_Mobile, CONVER_VALUE(13))
    .leftEqualToView(_Lab_Mobile)
    .rightEqualToView(_Lab_Mobile)
    .heightIs(CONVER_VALUE(13));
    
    _View_Line01.sd_layout
    .topSpaceToView(_Text_Mobile, CONVER_VALUE(10))
    .leftEqualToView(_Lab_Mobile)
    .rightEqualToView(_Lab_Mobile)
    .heightIs(1);
    
    _Lab_Check.sd_layout
    .topSpaceToView(_View_Line01, CONVER_VALUE(26))
    .leftEqualToView(_Lab_Mobile)
    .rightEqualToView(_Lab_Mobile)
    .heightIs(CONVER_VALUE(12));
    
    _Text_Check.sd_layout
    .topSpaceToView(_Lab_Check, CONVER_VALUE(13))
    .leftEqualToView(_Lab_Mobile)
    .rightSpaceToView(_Btn_State, CONVER_VALUE(5))
    .heightIs(CONVER_VALUE(13));
    
    _View_Line02.sd_layout
    .topSpaceToView(_Text_Check, CONVER_VALUE(10))
    .leftEqualToView(_Lab_Mobile)
    .rightEqualToView(_Lab_Mobile)
    .heightIs(1);
    
    _Btn_State.sd_layout
    .bottomSpaceToView(_View_Line02, CONVER_VALUE(6))
    .rightEqualToView(_Lab_Mobile)
    .widthIs(CONVER_VALUE(100))
    .heightIs(CONVER_VALUE(25));
    
    _Lab_Warning.sd_layout
    .topSpaceToView(_View_Line02, CONVER_VALUE(17))
    .leftEqualToView(_Lab_Mobile)
    .rightEqualToView(_Lab_Mobile)
    .heightIs(CONVER_VALUE(12));
    
    [self WarningAndHidden:YES];//默认隐藏
}
#pragma mark - 配置
- (void)WarningAndHidden:(BOOL)hidden{
    if (hidden) {
        _Lab_Warning.hidden = YES;
    }else{
        _Lab_Warning.hidden = NO;
    }
}
- (void)ClickBottenState{
    [self startTimer:60];
    
    if (_clickButtonStateBlocks) {
        _clickButtonStateBlocks();
    }
}
#pragma mark - 倒计时
// 定时器倒计时
//开始
- (void)startTimer:(int)timer
{
    _count = timer;
    _Btn_State.userInteractionEnabled = NO;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}
//结束
- (void)EndTimer{
    [self.countTimer invalidate];
    self.countTimer = nil;
    
    _Btn_State.userInteractionEnabled = YES;
    [_Btn_State setTitle:@"发送验证码" forState:UIControlStateNormal];
}
//运行时
- (void)countDown
{
    _count --;
    [_Btn_State setTitle:[NSString stringWithFormat:@"%ds后重试",_count] forState:UIControlStateNormal];
    if (_count <= 0) {
        NSLog(@"时间到");
        [self EndTimer];
    }
}
-(void)dealloc{
    [self EndTimer];
}
#pragma mark - 懒加载
- (UILabel *)Lab_Mobile{
    if (!_Lab_Mobile) {
        _Lab_Mobile = [[UILabel alloc]init];
        _Lab_Mobile.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
        _Lab_Mobile.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Lab_Mobile.text = @"手机号";
        _Lab_Mobile.textAlignment = NSTextAlignmentLeft;
    }
    return _Lab_Mobile;
}
- (UILabel *)Lab_Check{
    if (!_Lab_Check) {
        _Lab_Check = [[UILabel alloc]init];
        _Lab_Check.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
        _Lab_Check.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Lab_Check.text = @"验证码";
        _Lab_Check.textAlignment = NSTextAlignmentLeft;
    }
    return _Lab_Check;
}
- (UILabel *)Lab_Warning{
    if (!_Lab_Warning) {
        _Lab_Warning = [[UILabel alloc]init];
        _Lab_Warning.textColor = allcolorAlphasCT(255, 0, 0, 1.0);
        _Lab_Warning.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Lab_Warning.text = @"您填写的手机号或验证码有误！";
        _Lab_Warning.textAlignment = NSTextAlignmentLeft;
    }
    return _Lab_Warning;
}
- (UIButton *)Btn_State{
    if (!_Btn_State) {
        _Btn_State = [[UIButton alloc]init];
        [_Btn_State setTitle:@"发送验证码" forState:UIControlStateNormal];
        _Btn_State.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        _Btn_State.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
        
        [_Btn_State setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
        [_Btn_State.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1.0).CGColor];
        [_Btn_State.layer setBorderWidth:1];
        [_Btn_State.layer setMasksToBounds:YES];
        
        _Btn_State.layer.cornerRadius = CONVER_VALUE(5);//半径大小
        _Btn_State.layer.masksToBounds = YES;//是否切割
        
         [_Btn_State addTarget:self action:@selector(ClickBottenState) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Btn_State;
}
- (UITextField *)Text_Mobile{
    if (!_Text_Mobile) {
        _Text_Mobile = [[UITextField alloc]init];
        _Text_Mobile.placeholder = @"请输入手机号";
        _Text_Mobile.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
        _Text_Mobile.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
    }
    return _Text_Mobile;
}
- (UITextField *)Text_Check{
    if (!_Text_Check) {
        _Text_Check = [[UITextField alloc]init];
        _Text_Check.placeholder = @"请输入验证码";
        _Text_Check.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
        _Text_Check.textColor = allcolorAlphasCT(25, 25, 25, 1.0);
        
        _Text_Check.returnKeyType = UIReturnKeyDone;//更改键盘右下角返回样式
        _Text_Check.secureTextEntry = YES;
    }
    return _Text_Check;
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
- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}
@end
