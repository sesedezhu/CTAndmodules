//
//  GuanLianUserCtrl.m
//  HaiBa
//
//  Created by 涛程 on 2017/8/24.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "GuanLianUserCtrl.h"
#import "GLMiMaCtrl.h"

@interface GuanLianUserCtrl ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    NSString *msgInfo;
}
@property(nonatomic ,strong) UIView *viwe1;
@property(nonatomic ,strong) UIView *viwe2;
@property(nonatomic ,strong) UIView *viwe3;


@property(nonatomic ,strong) UILabel *Lab_1;
@property(nonatomic ,strong) UILabel *Lab_2;
@property(nonatomic ,strong) UILabel *Lab_3;


@property(nonatomic ,strong) UIButton *btn;
@property(nonatomic ,strong) UIButton *btn1;

@property(nonatomic ,strong) UITextField *Text_Name;
@property(nonatomic ,strong) UITextField *Text_Call;

@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end

@implementation GuanLianUserCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //加载ui
    [self loadGLUSerUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
   
    [MBProgressHUD hideHUD];
//    [_manager CancelRequests]; //取消所有网络请求
    if (_countTimer) {
        [self.countTimer invalidate];
        self.countTimer = nil;
    }
    [self textresignresponders];
}

#pragma mark - 网络请求
//获取验证码
- (void)loadGLZHNetWorkTime{
    
    
    if (_Text_Name.text.length == 11) {
        
        //启动定时器
        [self startTimer];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //结束倒计时
            [self EndTimer];
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
//发送绑定请求
- (void)loadNetWorkLogin{
    msgInfo = @"123456";
    if (!(_Text_Name.text.length == 11) || !(_Text_Call.text.length == 6) || ![_Text_Call.text isEqualToString:msgInfo]) {
        [MBProgressHUD showHUDMsg:@"手机号或者验证码格式错误"];
        return;
    }
    
    GLMiMaCtrl *glmm = [[GLMiMaCtrl alloc]init];
    [self.navigationController pushViewController:glmm animated:YES];
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
    [_Text_Name resignFirstResponder];
    [_Text_Call resignFirstResponder];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case 3:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 11) {
                [_Text_Call becomeFirstResponder];
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
#pragma mark - 倒计时
// 定时器倒计时
//开始
- (void)startTimer
{
    _count = 60;
    _btn1.userInteractionEnabled = NO;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}
//结束
- (void)EndTimer{
    [self.countTimer invalidate];
    self.countTimer = nil;
    _btn1.userInteractionEnabled = YES;
    [_btn1 setTitle:@"获取验证码" forState:UIControlStateNormal];
}
//运行时
- (void)countDown
{
    
    _count --;
    [_btn1 setTitle:[NSString stringWithFormat:@"%d秒后重试",_count] forState:UIControlStateNormal];
    if (_count <= 0) {
        NSLog(@"时间到");
        [self EndTimer];
    }
    
    
}

#pragma mark - UI
- (void)loadGLUSerUI{
    
    self.navigationItem.title = _NavTitle;
    self.view.backgroundColor = allcolorAlphasCT(255, 255, 255, 1.0);
    
    [self.view addSubview:self.viwe1];
    [self.view addSubview:self.Lab_1];
    [self.view addSubview:self.btn];
    [_viwe1 addSubview:self.Lab_2];
    [_viwe1 addSubview:self.Lab_3];
    [_viwe1 addSubview:self.Text_Name];
    [_viwe1 addSubview:self.Text_Call];
    [_viwe1 addSubview:self.viwe2];//线条
    [_viwe1 addSubview:self.viwe3];//线条
    [_viwe1 addSubview:self.btn1];
    
    _Lab_1.text = @"为了方便您的使用，请关联手机号码！";
    _Lab_2.text = @"手机号";
    _Lab_3.text = @"验证码";
    [_btn setTitle:@"确 定" forState:UIControlStateNormal];
    [_btn1 setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    _viwe1.backgroundColor = CTColorClear;
    _viwe2.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    _viwe3.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2);
    _btn.backgroundColor = allcolorAlphasCT(73, 75, 81, 1.0);
    
    _Lab_1.textColor = allcolorAlphasCT(255, 0, 0, 1.0);
    [_btn setTitleColor:allcolorAlphasCT(255, 255, 255, 1.0) forState:UIControlStateNormal];
    _Lab_2.textColor = CTColorGrayaAndBlack;
    _Lab_3.textColor = CTColorGrayaAndBlack;
    [_btn1 setTitleColor:allcolorAlphasCT(143, 152, 174, 1.0) forState:UIControlStateNormal];
    _Text_Name.textColor = CTColorGrayaAndBlack;
    _Text_Call.textColor = CTColorGrayaAndBlack;
    
    if (ABOVE_IOS9) {
        _Lab_1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Lab_2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Lab_3.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:CONVER_VALUE(12)];
        _Text_Name.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
        _Text_Call.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(14)];
    }else{
        _Lab_1.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Lab_2.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Lab_3.font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
        _Text_Name.font=[UIFont systemFontOfSize:CONVER_VALUE(14)];
        _Text_Call.font=[UIFont systemFontOfSize:CONVER_VALUE(14)];
    }
    
    
    
    _btn1.titleLabel.adjustsFontSizeToFitWidth = YES;
    _btn1.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(14)];
    
    _btn.layer.cornerRadius = CONVER_VALUE(5);
    _btn.clipsToBounds = YES;
    _btn1.layer.cornerRadius = CONVER_VALUE(5);
    _btn1.clipsToBounds = YES;
    
    [_btn1.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1).CGColor];
    [_btn1.layer setBorderWidth:1];
    [_btn1.layer setMasksToBounds:YES];
    
    [_btn addTarget:self action:@selector(loadNetWorkLogin) forControlEvents:UIControlEventTouchUpInside];
    [_btn1 addTarget:self action:@selector(loadGLZHNetWorkTime) forControlEvents:UIControlEventTouchUpInside];
    
    _btn1.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIView *views = self.view;
    UIView *views1 = self.viwe1;
    
    _viwe1.sd_layout
    .topSpaceToView(views, CONVER_VALUE(40))
    .leftSpaceToView(views, 0)
    .rightSpaceToView(views, 0)
    .heightIs(CONVER_VALUE(130));
    
    _Lab_2.sd_layout
    .topSpaceToView(views1, CONVER_VALUE(4))
    .leftSpaceToView(views1, CONVER_VALUE(52))
    .rightSpaceToView(views1, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(12));
    
    _Text_Name.sd_layout
    .topSpaceToView(_Lab_2, CONVER_VALUE(6))
    .leftEqualToView(_Lab_2)
    .rightEqualToView(_Lab_2)
    .heightIs(CONVER_VALUE(25));
    
    _viwe2.sd_layout
    .topSpaceToView(_Text_Name, CONVER_VALUE(6))
    .leftEqualToView(_Lab_2)
    .rightEqualToView(_Lab_2)
    .heightIs(1);
    
    _Lab_3.sd_layout
    .topSpaceToView(_viwe2, CONVER_VALUE(26))
    .leftEqualToView(_Lab_2)
    .rightEqualToView(_Lab_2)
    .heightIs(CONVER_VALUE(12));
    
    _Text_Call.sd_layout
    .topSpaceToView(_Lab_3, CONVER_VALUE(6))
    .leftEqualToView(_Lab_2)
    .widthIs(CONVER_VALUE(170))
    .heightIs(CONVER_VALUE(25));
    
    _viwe3.sd_layout
    .topSpaceToView(_Text_Call, CONVER_VALUE(6))
    .leftEqualToView(_Lab_2)
    .rightEqualToView(_Lab_2)
    .heightIs(1);
    
    _btn1.sd_layout
    .topEqualToView(_Text_Call)
    .rightEqualToView(_Lab_2)
    .leftSpaceToView(_Text_Call, CONVER_VALUE(4))
    .heightIs(CONVER_VALUE(25));
   
    _Lab_1.sd_layout
    .topSpaceToView(views1, CONVER_VALUE(15))
    .leftSpaceToView(views, CONVER_VALUE(52))
    .rightSpaceToView(views, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(12));
    
    _btn.sd_layout
    .topSpaceToView(_Lab_1, CONVER_VALUE(73))
    .leftSpaceToView(views, CONVER_VALUE(51))
    .rightSpaceToView(views, CONVER_VALUE(52))
    .heightIs(CONVER_VALUE(38));
    
    
    
}
#pragma mark - 懒加载
- (UIView *)viwe1{
    if (!_viwe1) {
        _viwe1 = [[UIView alloc]init];
    }
    return _viwe1;
}
- (UIView *)viwe2{
    if (!_viwe2) {
        _viwe2 = [[UIView alloc]init];
        
    }
    return _viwe2;
}
- (UIView *)viwe3{
    if (!_viwe3) {
        _viwe3 = [[UIView alloc]init];
        
    }
    return _viwe3;
}
- (UILabel *)Lab_1{
    if (!_Lab_1) {
        _Lab_1 = [[UILabel alloc]init];
    }
    return _Lab_1;
}
- (UILabel *)Lab_2{
    if (!_Lab_2) {
        _Lab_2 = [[UILabel alloc]init];
        
    }
    return _Lab_2;
}
- (UILabel *)Lab_3{
    if (!_Lab_3) {
        _Lab_3 = [[UILabel alloc]init];
        
    }
    return _Lab_3;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]init];
    }
    return _btn;
}
- (UIButton *)btn1{
    if (!_btn1) {
        _btn1 = [[UIButton alloc] init];
    }
    return _btn1;
}
- (UITextField *)Text_Call{
    if (!_Text_Call) {
        _Text_Call = [[UITextField alloc]init];
        _Text_Call.placeholder = @"请输入验证码";
        _Text_Call.delegate = self;
        _Text_Call.keyboardType = UIKeyboardTypeNumberPad;
        _Text_Call.tag = 2;
        _Text_Call.textAlignment = NSTextAlignmentLeft;
        _Text_Call.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;  //垂直居中
    }
    return _Text_Call;
}
- (UITextField *)Text_Name{
    if (!_Text_Name) {
        _Text_Name = [[UITextField alloc]init];
        _Text_Name.keyboardType = UIKeyboardTypeNumberPad;
        _Text_Name.placeholder = @"请输入手机号";
        _Text_Name.delegate = self;
        _Text_Name.tag = 3;
        _Text_Name.textAlignment = NSTextAlignmentLeft;
        _Text_Name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;  //垂直居中
    }
    return _Text_Name;
}

- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}
- (void)dealloc{
    if (_btn1) {
        [_btn1 removeFromSuperview];
    }
    if (_countTimer) {
        [self.countTimer invalidate];
        self.countTimer = nil;
    }
}
@end
