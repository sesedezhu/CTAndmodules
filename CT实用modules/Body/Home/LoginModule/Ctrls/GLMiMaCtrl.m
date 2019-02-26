//
//  GLMiMaCtrl.m
//  HaiBa
//
//  Created by 涛程 on 2017/8/25.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "GLMiMaCtrl.h"
#import "PasswordView001.h"
@interface GLMiMaCtrl ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
@property(nonatomic ,strong) UIView *GLMiMaBakview;
@property(nonatomic ,strong) UILabel *Lab_warning;
@property(nonatomic ,strong) UIButton *btn;
@property(nonatomic ,strong) PasswordView001 *TextViewOne;
@property(nonatomic ,strong) PasswordView001 *TextViewTwo;


@end

@implementation GLMiMaCtrl
#pragma mark - 导航返回按钮功能
- (void)GLMiMaNavBarPopCtrls{
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc]initWithTitle:nil style:UIBarButtonItemStyleDone target:self action:@selector(GLMiMaNavBarButtonAction)];
    backButton.title = @"跳过";
    self.navigationItem.rightBarButtonItem=backButton;
}
- (void)GLMiMaNavBarButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GLMiMaNavBarPopCtrls];
    //加载ui
    [self loadGLUSerUI];
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
- (BOOL)isTextcontentAndSuccessful:(UITextField *)TextField{
    if ((TextField.text.length != 0) ) {
        BOOL a = [self judgePassWordLegal:TextField.text];
        if (!a) {
            [MBProgressHUD showHUDMsg:@"密码输入格式不正确"];
            return YES;
        }
    }else{
        [MBProgressHUD showHUDMsg:@"账号不能为空"];
        return YES;
    }
    return NO;
}
//发送设置密码请求
- (void)loadNetWorkLogin{
    BOOL textOne = [self isTextcontentAndSuccessful:_TextViewOne.Text_content];
    BOOL textTwo = [self isTextcontentAndSuccessful:_TextViewTwo.Text_content];
    if (textOne || textTwo) {
        return;
    }
//    MBHUD;
    if (![_TextViewOne.Text_content.text isEqualToString:_TextViewTwo.Text_content.text]) {
        MBHUD_Warning(@"两次密码不一致");
        return;
    }
    
   [self.navigationController popToRootViewControllerAnimated:YES];
    
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
   
    [_TextViewTwo.Text_content resignFirstResponder];
    [_TextViewOne.Text_content resignFirstResponder];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case 4:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 16) {
                textField.text = [toBeString substringToIndex:16];
            }
        }
            break;
        case 5:
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
    self.navigationItem.title = @"设置密码";

    self.view.backgroundColor = allcolorAlphasCT(255, 255, 255, 1.0);
    
    [self.view addSubview:self.GLMiMaBakview];
    [self.view addSubview:self.Lab_warning];
    [self.view addSubview:self.btn];
    [_GLMiMaBakview addSubview:self.TextViewOne];
    [_GLMiMaBakview addSubview:self.TextViewTwo];

    _GLMiMaBakview.backgroundColor = allcolorAlphasCT(255, 255, 255, 1.0);
    _btn.backgroundColor = allcolorAlphasCT(73, 75, 85, 1.0);

    _Lab_warning.textColor = allcolorAlphasCT(255, 0, 0, 1.0);
    [_btn setTitleColor:allcolorAlphasCT(255, 255, 255, 1.0) forState:UIControlStateNormal];
    
    _Lab_warning.text = @"为了方便您的使用，请设置密码！";
    _TextViewOne.Lab_name.text = @"密码";
    _TextViewTwo.Lab_name.text = @"密码确认";
//    _TextViewOne.Text_content.placeholder = @"请输入您的密码";
//    _TextViewTwo.Text_content.placeholder = @"请再次输入您的密码";
    [_btn setTitle:@"确 定" forState:UIControlStateNormal];

    if (ABOVE_IOS9){
        _Lab_warning.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
    }else{
        _Lab_warning.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
    }
    
    _btn.layer.cornerRadius = CONVER_VALUE(5);
    _btn.clipsToBounds = YES;
   
    [_btn addTarget:self action:@selector(loadNetWorkLogin) forControlEvents:UIControlEventTouchUpInside];
   
    _TextViewOne.Text_content.tag = 4;
    _TextViewTwo.Text_content.tag = 5;
    
    UIView *views = self.view;
    _GLMiMaBakview.sd_layout
    .topSpaceToView(views, CONVER_VALUE(51))
    .leftSpaceToView(views, 0)
    .rightSpaceToView(views, 0)
    .heightIs(CONVER_VALUE(126));
    
    _TextViewOne.sd_layout
    .rightSpaceToView(_GLMiMaBakview, CONVER_VALUE(1))
    .leftEqualToView(_GLMiMaBakview)
    .rightEqualToView(_GLMiMaBakview)
    .heightIs(CONVER_VALUE(50));
    
    _TextViewTwo.sd_layout
    .topSpaceToView(_TextViewOne, CONVER_VALUE(25))
    .leftEqualToView(_GLMiMaBakview)
    .rightEqualToView(_GLMiMaBakview)
    .heightIs(CONVER_VALUE(50));
    
    _Lab_warning.sd_layout
    .topSpaceToView(_GLMiMaBakview, CONVER_VALUE(19))
    .leftSpaceToView(views, CONVER_VALUE(52))
    .rightSpaceToView(views, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(12));
    
    _btn.sd_layout
    .topSpaceToView(_Lab_warning, CONVER_VALUE(73))
    .leftEqualToView(_Lab_warning)
    .rightEqualToView(_Lab_warning)
    .heightIs(CONVER_VALUE(38));
    
}
#pragma mark - 懒加载
- (UIView *)GLMiMaBakview{
    if (!_GLMiMaBakview) {
        _GLMiMaBakview = [[UIView alloc]init];
    }
    return _GLMiMaBakview;
}

- (UILabel *)Lab_warning{
    if (!_Lab_warning) {
        _Lab_warning = [[UILabel alloc]init];
    }
    return _Lab_warning;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]init];
    }
    return _btn;
}
- (PasswordView001 *)TextViewOne{
    if (!_TextViewOne) {
        _TextViewOne = [[PasswordView001 alloc]init];
    }
    return _TextViewOne;
}
- (PasswordView001 *)TextViewTwo{
    if (!_TextViewTwo) {
        _TextViewTwo = [[PasswordView001 alloc]init];
    }
    return _TextViewTwo;
}



@end
