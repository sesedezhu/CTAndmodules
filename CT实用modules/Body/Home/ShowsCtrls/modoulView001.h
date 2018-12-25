//
//  modoulView001.h
//  CT实用modules
//
//  Created by 涛程 on 2018/12/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface modoulView001 : UIView
@property(nonatomic ,strong) UILabel *topTitleLabel;//变价通知
@property(nonatomic ,strong) UILabel *toponeTitleLabel;//简介
@property(nonatomic ,strong) UILabel *telLabel;//手机号
@property(nonatomic ,strong) UITextField *telTextField;//请输入手机号
@property(nonatomic ,strong) UILabel *numsLabel;//验证码
@property(nonatomic ,strong) UITextField *numTextField;//输入验证码
@property(nonatomic ,strong) UIButton *yanzhengmbutton;//获取验证码
@property(nonatomic ,strong) UIButton *selbutton;//选中
@property(nonatomic ,strong) UILabel *selLabel;//我已阅读并同意
@property(nonatomic ,strong) UIButton *yinsibutton;//《隐私权政策》
@property(nonatomic ,strong) UIButton *wofangbutton;//我房网服务协议》
@property(nonatomic ,strong) UIButton *quxiaobutton;//@"取 消
@property(nonatomic ,strong) UIButton *quedingbutton;//@"确 定"

@end
