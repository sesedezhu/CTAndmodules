//
//  modoulView001.m
//  CT实用modules
//
//  Created by 涛程 on 2018/12/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "modoulView001.h"

@implementation modoulView001
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _topTitleLabel = [[UILabel alloc] init];
//    _topTitleLabel.backgroundColor = WFColor(255, 255, 255);
    _topTitleLabel.text = @"变价通知";
    _topTitleLabel.textAlignment = NSTextAlignmentCenter;
    _topTitleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
//    _topTitleLabel.textColor = WFColor(51, 51, 51);
    [self addSubview:_topTitleLabel];
    
    _toponeTitleLabel = [[UILabel alloc] init];
//    toponeTitleLabel.backgroundColor = WFColor(255, 255, 255);
//    toponeTitleLabel.text = bouncetishiyuStr;//简介
    _toponeTitleLabel.textAlignment = NSTextAlignmentCenter;
    _toponeTitleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
//    toponeTitleLabel.textColor = WFColor(153, 153, 153);
    [self addSubview:_toponeTitleLabel];
    
    
    _telLabel = [[UILabel alloc] init];
//    telLabel.backgroundColor = WFColor(255, 255, 255);
    //telLabel.frame = CGRectMake(0, toponeTitleLabel.frame.origin.y+30, 50, 20);
    _telLabel.text = @"手机号";
    _telLabel.textAlignment = NSTextAlignmentCenter;
    _telLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
//    telLabel.textColor = WFColor(49, 49, 49);
    // telLabel.backgroundColor = WFRandomColor;
    [self addSubview:_telLabel];

    
    _telTextField = [[UITextField alloc] init];
//    telTextField.backgroundColor = WFColor(255, 255, 255);
    _telTextField.placeholder = @"请输入手机号";
    _telTextField.textAlignment = NSTextAlignmentLeft;
    _telTextField.borderStyle = UITextBorderStyleRoundedRect;
    _telTextField.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
//    telTextField.textColor =  WFColor(49, 49, 49);
    [self addSubview:_telTextField];
//    self.telMyTextField = telTextField;
    
    
    _numsLabel = [[UILabel alloc] init];
//    numsLabel.backgroundColor = WFColor(255, 255, 255);
    _numsLabel.text = @"验证码";
    _numsLabel.textAlignment = NSTextAlignmentCenter;
    _numsLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
//    numsLabel.textColor =  WFColor(49, 49, 49);
    [self addSubview:_numsLabel];
    
    _numTextField = [[UITextField alloc] init];
//    numTextField.backgroundColor = WFColor(255, 255, 255);
    _numTextField.placeholder = @"输入验证码";
    _numTextField.borderStyle = UITextBorderStyleRoundedRect;
    _numTextField.textAlignment = NSTextAlignmentLeft;
    _numTextField.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
//    numTextField.textColor =  WFColor(49, 49, 49);
    [self addSubview:_numTextField];
//    self.yanzhengmaTextField = numTextField;
    
    
    
    _yanzhengmbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _yanzhengmbutton.frame = CGRectMake(CONVER_VALUE(12), CONVER_VALUE(_numTextField.frame.origin.y+9), CONVER_VALUE(64), CONVER_VALUE(30));
    [_yanzhengmbutton setTitle:@"获取验证码" forState:UIControlStateNormal];
//    [yanzhengmbutton setTitleColor:WFColor(255, 140, 64) forState:UIControlStateNormal];
    _yanzhengmbutton.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
    _yanzhengmbutton.tag = 8;
//    [yanzhengmbutton addTarget:self action:@selector(quxiaoSelButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_yanzhengmbutton];
    
    
    _selbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selbutton setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    _selbutton.selected = YES;
    _selbutton.tag = 9;
//    selButtonStr = @"1";
//    [selbutton addTarget:self action:@selector(quxiaoSelButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_selbutton];
    
    
    _selLabel = [[UILabel alloc] init];
//    selLabel.backgroundColor = WFColor(255, 255, 255);
    _selLabel.text = @"我已阅读并同意";
    _selLabel.textAlignment = NSTextAlignmentLeft;
    _selLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
//    selLabel.textColor =  WFColor(49, 49, 49);
    [self addSubview:_selLabel];
    
    _yinsibutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_yinsibutton setTitle:@"《隐私权政策》" forState:UIControlStateNormal];
//    [yinsibutton setTitleColor:WFColor(255, 140, 64) forState:UIControlStateNormal];
//    [yinsibutton addTarget:self action:@selector(quxiaoSelButton:) forControlEvents:UIControlEventTouchUpInside];
    _yinsibutton.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
    _yinsibutton.tag = 30;
    [self addSubview:_yinsibutton];
    
    _wofangbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    //wofangbutton.frame = CGRectMake(100, selLabel.frame.origin.y+20, 120, 25);
    [_wofangbutton setTitle:@"《我房网服务协议》" forState:UIControlStateNormal];
//    [wofangbutton setTitleColor:WFColor(255, 140, 64) forState:UIControlStateNormal];
//    [wofangbutton addTarget:self action:@selector(quxiaoSelButton:) forControlEvents:UIControlEventTouchUpInside];
    _wofangbutton.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
    _wofangbutton.tag = 31;
    [self addSubview:_wofangbutton];
    

    _quxiaobutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_quxiaobutton setTitle:@"取 消" forState:UIControlStateNormal];
//    [quxiaobutton setTitleColor:WFColor(255, 140, 64) forState:UIControlStateNormal];
//    [quxiaobutton addTarget:self action:@selector(quxiaoSelButton:) forControlEvents:UIControlEventTouchUpInside];
    _quxiaobutton.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(16)];
    _quxiaobutton.tag = 10;
    //关键语句
    _quxiaobutton.layer.cornerRadius = 2.0;//2.0是圆角的弧度，根据需求自己更改
//    quxiaobutton.layer.borderColor = WFColor(255, 140, 64).CGColor;//设置边框颜色
    _quxiaobutton.layer.borderWidth = 0.5f;//设置边框宽度
    [self addSubview:_quxiaobutton];
    
    
    _quedingbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_quedingbutton setTitle:@"确 定" forState:UIControlStateNormal];
//    quedingbutton.backgroundColor  = WFColor(255, 140, 64);
//    [quedingbutton addTarget:self action:@selector(quxiaoSelButton:) forControlEvents:UIControlEventTouchUpInside];
//    [quedingbutton setTitleColor:WFColor(255, 255, 255) forState:UIControlStateNormal];
    _quedingbutton.tag = 11;
    _quedingbutton.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(16)];
    //关键语句
    _quedingbutton.layer.cornerRadius = 2.0;//2.0是圆角的弧度，根据需求自己更改
//    quedingbutton.layer.borderColor = WFColor(255, 140, 64).CGColor;//设置边框颜色
    _quedingbutton.layer.borderWidth = 0.5f;//设置边框宽度
    [self addSubview:_quedingbutton];
    
    
    //加载fram值
    [self loadFram];
}
- (void)loadFram{
    UIView *view = self;
    _topTitleLabel.sd_layout
    .topSpaceToView(view, CONVER_VALUE(26))
    .leftSpaceToView(view, CONVER_VALUE(19))
    .rightSpaceToView(view, CONVER_VALUE(19))
    .heightIs(CONVER_VALUE(18));
    
    _toponeTitleLabel.sd_layout
    .topSpaceToView(_topTitleLabel, CONVER_VALUE(17))
    .leftEqualToView(_topTitleLabel)
    .rightEqualToView(_topTitleLabel)
    .heightIs(CONVER_VALUE(13));
    
    _telLabel.sd_layout
    .topSpaceToView(_toponeTitleLabel, CONVER_VALUE(14))
    .leftEqualToView(_toponeTitleLabel)
    .widthIs(CONVER_VALUE(43))
    .heightIs(CONVER_VALUE(30));
    
    _telTextField.sd_layout
    .topEqualToView(_telLabel)
    .leftSpaceToView(_telLabel, 4)
    .rightEqualToView(_topTitleLabel)
    .heightIs(CONVER_VALUE(30));
    
    _numsLabel.sd_layout
    .topSpaceToView(_telLabel, CONVER_VALUE(9))
    .leftEqualToView(_telLabel)
    .widthIs(CONVER_VALUE(43))
    .heightIs(CONVER_VALUE(30));
    
    _numTextField.sd_layout
    .topEqualToView(_numsLabel)
    .leftSpaceToView(_numsLabel, 4)
    .widthIs(CONVER_VALUE(90))
    .heightIs(CONVER_VALUE(30));
    
    _yanzhengmbutton.sd_layout
    .topEqualToView(_numsLabel)
    .leftSpaceToView(_numTextField, 12)
    .rightEqualToView(_telTextField)
    .heightIs(CONVER_VALUE(30));
    
    _selbutton.sd_layout
    .topSpaceToView(_numsLabel, CONVER_VALUE(14))
    .leftEqualToView(_numsLabel)
    .widthIs(CONVER_VALUE(12))
    .heightIs(CONVER_VALUE(12));
    
    _selLabel.sd_layout
    .topEqualToView(_selbutton)
    .leftSpaceToView(_selbutton, 4)
    .rightEqualToView(_topTitleLabel)
    .heightIs(CONVER_VALUE(14));
    
    _yinsibutton.sd_layout
    .topSpaceToView(_selLabel, CONVER_VALUE(3))
    .leftEqualToView(_selbutton)
    .widthIs(CONVER_VALUE(99))
    .heightIs(CONVER_VALUE(14));
    
    _wofangbutton.sd_layout
    .topEqualToView(_yinsibutton)
    .leftSpaceToView(_yinsibutton, CONVER_VALUE(7))
    .widthIs(CONVER_VALUE(95))
    .heightIs(CONVER_VALUE(14));
    
    _quxiaobutton.sd_layout
    .topSpaceToView(_yinsibutton, CONVER_VALUE(22))
    .leftSpaceToView(view, CONVER_VALUE(32))
    .widthIs(CONVER_VALUE(80))
    .heightIs(CONVER_VALUE(35));
    
    _quedingbutton.sd_layout
    .topEqualToView(_quxiaobutton)
    .rightSpaceToView(view, CONVER_VALUE(32))
    .widthIs(CONVER_VALUE(80))
    .heightIs(CONVER_VALUE(35));
}




@end
