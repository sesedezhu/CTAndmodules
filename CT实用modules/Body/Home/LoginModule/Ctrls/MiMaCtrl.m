//
//  MiMaCtrl.m
//  HaiBa
//
//  Created by 涛程 on 2017/8/25.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "MiMaCtrl.h"
#import "TextModelView.h"
#import "TextModelTime.h"
@interface MiMaCtrl ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    NSString *msgInfo;
}

@property(nonatomic ,strong) UILabel *Lab_warning;
@property(nonatomic ,strong) UIButton *Btn;
@property(nonatomic ,strong) TextModelTime *TimeView;
@property(nonatomic ,strong) TextModelView *OneView;
@property(nonatomic ,strong) TextModelView *TwoView;


@property (nonatomic, copy)   NSString * modifyFlag;  //方式 1:修改密码 2:找回密码
@property (nonatomic, copy)   NSString * remarkInfo;  //短信模板（3:手机密码找回）
@end

@implementation MiMaCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载ui
    [self loadGLUSerUI];
    
    
#warning 本类默认属性配置
    _remarkInfo = @"3";
    if ([_NavTitle isEqualToString:@"修改密码"]) {
        _modifyFlag = @"1";
    }else{
        _modifyFlag = @"2";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [MBProgressHUD hideHUD];
//    [_manager CancelRequests]; //取消所有网络请求

    [self textresignresponders];
}

#pragma mark - 网络请求
//获取验证码
- (void)loadGLZHNetWorkTime{
    
    
    if (_OneView.Text_content.text.length == 11) {
        
        //启动定时器
        [self.TimeView startTimer];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //结束倒计时
            [_TimeView EndTimer];
        });
        
    }else{
        [MBProgressHUD showHUDMsg:@"手机号码格式输入错误"];
    }
}
-(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    if ([pass length] >= 6){
        // 密码由6-16位字母、数字、特殊字符组合
        NSString * regex = @"^(?!\\D+$)(?![^a-zA-Z]+$)\\S{6,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}
//发送关联请求
- (void)loadNetWorkLogin{
    
    
    if (!(_OneView.Text_content.text.length == 11 || !(_TimeView.Text_content.text.length == 6) || ![_TimeView.Text_content.text isEqualToString:msgInfo])) {
        [MBProgressHUD showHUDMsg:@"手机号或者验证码格式错误"];
        return;
    }
    
    if ((_TwoView.Text_content.text.length != 0) ) {
        BOOL a = [self judgePassWordLegal:_TwoView.Text_content.text];
        
        if (!a) {
            [MBProgressHUD showHUDMsg:@"密码输入格式不正确"];
            return;
        }
    }else{
        [MBProgressHUD showHUDMsg:@"密码不能为空"];
        return;
    }
    [self XGCGMiMa];
    
}

- (void)XGCGMiMa{
     dispatch_async(dispatch_get_main_queue(), ^{
         [self.navigationController popViewControllerAnimated:YES];
     });
    
}
#pragma mark - 键盘代理
//取消text第一响应，键盘消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self textresignresponders];
}
//取消text第一响应，键盘消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self textresignresponders];
    return YES;
}
- (void)textresignresponders{
    [_OneView.Text_content resignFirstResponder];
    [_TimeView.Text_content resignFirstResponder];
    [_TwoView.Text_content resignFirstResponder];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case 2:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 6) {
                [_TwoView.Text_content becomeFirstResponder];
                return NO;
            }
        }
            break;
            
        case 3:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 11) {
                [_TimeView.Text_content becomeFirstResponder];
            }
        }
            break;
            
        case 4:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 16) {
                textField.text = [toBeString substringToIndex:16];
            }
        }
            break;
            
        default:
            break;
    }
    return YES;
}


#pragma mark - UI
- (void)loadGLUSerUI{
    self.navigationItem.title = _NavTitle;
    self.view.backgroundColor = allcolorAlphasCT(255, 255, 255, 1.0);
    
    [self.view addSubview:self.OneView];
    [self.view addSubview:self.TimeView];
    [self.view addSubview:self.TwoView];
//    [self.view addSubview:self.Lab_warning];
    [self.view addSubview:self.Btn];
    
    UIView *view = self.view;
    _OneView.sd_layout
    .topSpaceToView(view, CONVER_VALUE(51))
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .heightIs(CONVER_VALUE(50));
    
    _TimeView.sd_layout
    .topSpaceToView(_OneView, CONVER_VALUE(25))
    .leftEqualToView(_OneView)
    .rightEqualToView(_OneView)
    .heightIs(CONVER_VALUE(50));
    
    _TwoView.sd_layout
    .topSpaceToView(_TimeView, CONVER_VALUE(25))
    .leftEqualToView(_OneView)
    .rightEqualToView(_OneView)
    .heightIs(CONVER_VALUE(50));
    
    _Btn.sd_layout
    .topSpaceToView(_TwoView, CONVER_VALUE(46))
    .leftSpaceToView(view, CONVER_VALUE(52))
    .rightSpaceToView(view, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(38));
    
    
   
}
#pragma mark - 懒加载
- (UILabel *)Lab_warning{
    if (!_Lab_warning) {
        _Lab_warning = [[UILabel alloc]init];
    }
    return _Lab_warning;
}
- (UIButton *)Btn{
    if (!_Btn) {
        _Btn = [[UIButton alloc]init];
        [_Btn setTitle:@"确 定" forState:UIControlStateNormal];
        _Btn.backgroundColor = allcolorAlphasCT(73, 75, 81, 1.0);
        [_Btn setTitleColor:allcolorAlphasCT(255, 255, 255, 1.0) forState:UIControlStateNormal];
        _Btn.layer.cornerRadius = CONVER_VALUE(5);
        _Btn.clipsToBounds = YES;
    }
    return _Btn;
}
- (TextModelTime *)TimeView{
    if (!_TimeView) {
        _TimeView = [[TextModelTime alloc]init];
        _TimeView.Text_content.delegate = self;
        _TimeView.Text_content.tag = 2;
        _TimeView.Text_content.placeholder = @"请输入验证码";
        [_TimeView.Btn_time addTarget:self action:@selector(loadGLZHNetWorkTime) forControlEvents:UIControlEventTouchUpInside];
    }
    return _TimeView;
}
- (TextModelView *)OneView{
    if (!_OneView) {
        _OneView = [[TextModelView alloc]init];
        _OneView.Lab_name.text = @"手机号";
        _OneView.Text_content.placeholder = @"请输入手机号";
        _OneView.Text_content.keyboardType = UIKeyboardTypeNumberPad;
        _OneView.Text_content.delegate = self;
        _OneView.Text_content.tag = 3;
        _OneView.Text_content.textAlignment = NSTextAlignmentLeft;
    }
    return _OneView;
}
- (TextModelView *)TwoView{
    if (!_TwoView) {
        _TwoView = [[TextModelView alloc]init];
        _TwoView.Text_content.keyboardType = UIKeyboardTypeDefault;
        _TwoView.Lab_name.text = @"新密码";
        _TwoView.Text_content.placeholder = @"密码由6-16位字母、数字组合";
        _TwoView.Text_content.delegate = self;
        _TwoView.Text_content.tag = 4;
        
        _TwoView.Text_content.secureTextEntry = YES;
        _TwoView.Text_content.textAlignment = NSTextAlignmentLeft;
    }
    return _TwoView;
}

@end
