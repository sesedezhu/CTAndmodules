//
//  TextModelTime2.m
//  CT实用modules
//
//  Created by chengtao on 2019/2/10.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "TextModelTime2.h"
@interface TextModelTime2 ()
@property(nonatomic ,strong) UIView *view_line;
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end
@implementation TextModelTime2
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
    [self addSubview:self.Text_content];
    [self addSubview:self.Btn_time];
    [self addSubview:self.view_line];
    UIView *verticalLine = [[UIView alloc]init];
    verticalLine.backgroundColor = allcolorAlphasCT(225, 225, 225, 1.0);
    [self addSubview:verticalLine];
    
    UIView *view = self;
    _letImageView.sd_layout
    .topSpaceToView(view, CONVER_VALUE(26))
    .leftSpaceToView(view, CONVER_VALUE(14))
    .widthIs(CONVER_VALUE(20))
    .heightIs(CONVER_VALUE(17));
    
    _Text_content.sd_layout
    .topSpaceToView(view, CONVER_VALUE(21))
    .leftSpaceToView(_letImageView, CONVER_VALUE(10))
    .widthIs(CONVER_VALUE(215))
    .heightIs(CONVER_VALUE(27));
    
    verticalLine.sd_layout
    .topSpaceToView(view, CONVER_VALUE(16))
    .bottomSpaceToView(view, CONVER_VALUE(16))
    .leftSpaceToView(_Text_content, 0)
    .widthIs(1);
    
    _Btn_time.sd_layout
    .topEqualToView(_Text_content)
    .rightEqualToView(view)
    .leftSpaceToView(verticalLine, CONVER_VALUE(10))
    .heightIs(CONVER_VALUE(27));
    
    _view_line.sd_layout
    .topSpaceToView(_letImageView, CONVER_VALUE(24))
    .leftEqualToView(view)
    .rightEqualToView(view)
    .heightIs(1);
    
    
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
- (UIImageView *)letImageView{
    if (!_letImageView) {
        _letImageView = [CTUIManagers createImageViewURL:nil placeholderImage:@"yaoshi2"];
    }
    return _letImageView;
}
- (UIView *)view_line{
    if (!_view_line) {
        _view_line = [CTUIManagers createView];
        _view_line.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    }
    return _view_line;
}
- (UITextField *)Text_content{
    if (!_Text_content) {
        _Text_content = [CTUIManagers createTextFieldPlaceholder:@"请输入短信验证码" keyboardType:UIKeyboardTypeNumberPad backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentLeft];
        _Text_content.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;  //垂直居中
        _Text_content.textColor = allcolorAlphasCT(145, 145, 145, 1.0);
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
//        _Btn_time.layer.cornerRadius = CONVER_VALUE(5);
//        _Btn_time.clipsToBounds = YES;
//
//        [_Btn_time.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1).CGColor];
//        [_Btn_time.layer setBorderWidth:1];
//        [_Btn_time.layer setMasksToBounds:YES];
        _Btn_time.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _Btn_time.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn_time.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
        [_Btn_time setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
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
