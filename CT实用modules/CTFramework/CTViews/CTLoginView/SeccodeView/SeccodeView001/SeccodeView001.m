//
//  TextModelTime.m
//  Travels
//
//  Created by 涛程 on 2018/9/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "SeccodeView001.h"
@interface SeccodeView001 ()
@property(nonatomic ,strong) UIView *view_line;
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end
@implementation SeccodeView001
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
    [self addSubview:self.Text_content];
    [self addSubview:self.Btn_time];
    [self addSubview:self.view_line];
    
    _Lab_name.textColor = allcolorAlphasCT(51, 51, 51, 1.0);
    _Text_content.textColor = allcolorAlphasCT(51, 51, 51, 1.0);
    [_Btn_time setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
    _view_line.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    
    _Btn_time.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
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
    .widthIs(CONVER_VALUE(170))
    .heightIs(CONVER_VALUE(25));
    
    _Btn_time.sd_layout
    .topEqualToView(_Text_content)
    .rightEqualToView(_Lab_name)
    .leftSpaceToView(_Text_content, CONVER_VALUE(4))
    .heightIs(CONVER_VALUE(25));
    
    _view_line.sd_layout
    .topSpaceToView(_Text_content, CONVER_VALUE(6))
    .leftEqualToView(_Lab_name)
    .rightEqualToView(_Lab_name)
    .heightIs(1);
    
    
    _Lab_name.text = @"验证码";
    [_Btn_time setTitle:@"获取验证码" forState:UIControlStateNormal];
}
#pragma mark - 倒计时
// 定时器倒计时
//开始
- (void)startTimer
{
    _count = 60;
    _Btn_time.userInteractionEnabled = NO;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}
//结束
- (void)EndTimer{
    [_countTimer invalidate];
    _countTimer = nil;
    _Btn_time.userInteractionEnabled = YES;
    [_Btn_time setTitle:@"获取验证码" forState:UIControlStateNormal];
}
//运行时
- (void)countDown
{
    
    _count --;
    [_Btn_time setTitle:[NSString stringWithFormat:@"%d秒后重试",_count] forState:UIControlStateNormal];
    if (_count <= 0) {
        NSLog(@"时间到");
        [self EndTimer];
    }
    
    
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
        _Text_content.placeholder = @"请输入验证码";
        _Text_content.keyboardType = UIKeyboardTypeNumberPad;
        _Text_content.textAlignment = NSTextAlignmentLeft;
        _Text_content.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;  //垂直居中
        
    }
    return _Text_content;
}
- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}
- (UIButton *)Btn_time{
    if (!_Btn_time) {
        _Btn_time = [[UIButton alloc] init];
        _Btn_time.layer.cornerRadius = CONVER_VALUE(5);
        _Btn_time.clipsToBounds = YES;
        
        [_Btn_time.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1).CGColor];
        [_Btn_time.layer setBorderWidth:1];
        [_Btn_time.layer setMasksToBounds:YES];
        _Btn_time.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _Btn_time.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _Btn_time;
}
- (void)dealloc{
    if (_Btn_time) {
        [_Btn_time removeFromSuperview];
    }
    if (_countTimer) {
        [_countTimer invalidate];
         _countTimer = nil;
    }
}
@end
