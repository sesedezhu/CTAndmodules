//
//  MiMaCtrl.m
//  HaiBa
//
//  Created by 涛程 on 2017/8/25.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "MiMaCtrl.h"

@interface MiMaCtrl ()<UITextFieldDelegate,UIGestureRecognizerDelegate,ZYHttpManagerDelegate>
{
    NSString *msgInfo;
}
@property(nonatomic ,strong) UIView *viwe1;
@property(nonatomic ,strong) UIView *viwe2;
@property(nonatomic ,strong) UIView *viwe3;
@property(nonatomic ,strong) UIView *viwe4;

@property(nonatomic ,strong) UILabel *Lab_1;
@property(nonatomic ,strong) UILabel *Lab_2;
@property(nonatomic ,strong) UILabel *Lab_3;
@property(nonatomic ,strong) UILabel *Lab_4;

@property(nonatomic ,strong) UIButton *btn;
@property(nonatomic ,strong) UIButton *btn1;

@property(nonatomic ,strong) UITextField *Text_Name;
@property(nonatomic ,strong) UITextField *Text_Call;
@property(nonatomic ,strong) UITextField *Text_ZhangHao;

//网络请求
@property (nonatomic ,retain)LAndRRequest *manager;
@property(nonatomic,retain)NSMutableDictionary *messageDic;

@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end

@implementation MiMaCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载ui
    [self loadGLUSerUI];
    
    if ([_modifyFlag isEqualToString:@"1"]) {
        NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
        NSString *mobile =UserDic[@"mobile"];
        BOOL mobilebool = [CTFreeText deptNumInputShouldNumber:mobile];
        if (mobile.length == 11){
            if (mobilebool){
                _Text_Name.text = UserDic[@"mobile"];
            }
        }
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
        
        self.manager=[[LAndRRequest alloc]init];
        _manager.delegate=self;
        _manager.tag = 1100;
        
       
        self.messageDic = [[NSMutableDictionary alloc]init];
        [_messageDic setObject:_Text_Name.text forKey:@"mobileNo"];
        [_messageDic setObject:_remarkInfo forKey:@"remarkInfo"];
        
        //拼接字符串，生产md5
        NSString *md5Str = [NSString stringWithFormat:@"%@%@naliwan",_Text_Name.text,_remarkInfo];
        NSString *md5 = [LCMD5Tool MD5ForUpper32Bate:md5Str];
        [_messageDic setObject:md5 forKey:@"sign"];
        
//        [_manager startPostConnectionWithPath:NLWSendDps parameter:_messageDic CaCha:NO];
        
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
    
    
    if (!(_Text_Name.text.length == 11 || !(_Text_Call.text.length == 6) || ![_Text_Call.text isEqualToString:msgInfo])) {
        [MBProgressHUD showHUDMsg:@"手机号或者验证码格式错误"];
        return;
    }
    
    if ((_Text_ZhangHao.text.length != 0) ) {
        BOOL a = [self judgePassWordLegal:_Text_ZhangHao.text];
        
        if (!a) {
            [MBProgressHUD showHUDMsg:@"密码输入格式不正确"];
            return;
        }
        
    }else{
        [MBProgressHUD showHUDMsg:@"密码不能为空"];
        return;
    }
    
    
//    MBHUD;
    
    
    
    NSString *md5Str;
    NSString *md5;
    NSString * mimamd5 = [LCMD5Tool MD5ForLower32Bate:_Text_ZhangHao.text];
    
    
    self.manager=[[LAndRRequest alloc]init];
    _manager.delegate=self;
    _manager.tag = 1101;
    
    
    
    self.messageDic = [[NSMutableDictionary alloc]init];

    [_messageDic setObject:_modifyFlag forKey:@"modifyFlag"];
    [_messageDic setObject:_Text_Name.text forKey:@"mobileNo"];
    [_messageDic setObject:_remarkInfo forKey:@"remarkInfo"];
    [_messageDic setObject:_Text_Call.text forKey:@"msgInfo"];
    [_messageDic setObject:mimamd5 forKey:@"password"];
    
    md5Str = [NSString stringWithFormat:@"%@%@%@%@%@naliwan",_Text_Name.text,_modifyFlag,_Text_Call.text,mimamd5,_remarkInfo];
    md5 = [LCMD5Tool MD5ForUpper32Bate:md5Str];
    [_messageDic setObject:md5 forKey:@"sign"];
    
//    [_manager startPostConnectionWithPath:NLWModifyUserPwd parameter:_messageDic CaCha:NO];
   
    NSLog(@"_messageDic ======== %@",_messageDic);
}
#pragma mark - 请求成功回调处理
//缓存数据
- (void)CaChaToRequest:(LAndRRequest* )manager withData:(id)data{
}
//成功了
- (void)successToRequest:(LAndRRequest* )manager withData:(id)data{
    [MBProgressHUD hideHUD];
    NSString *errCode = [data objectForKey:@"errCode"];
    
    switch (manager.tag) {
        case 1100:
        {
            if ([errCode isEqualToString:@"00000"]) {
                NSDictionary *UserDic = data[@"data"];
                msgInfo = UserDic[@"msgInfo"];
            }else{
                NSString *errMsg = [data objectForKey:@"errMsg"];
                [MBProgressHUD showHUDMsg:errMsg];
                //结束倒计时
                [self EndTimer];
            }
        }
            break;
        case 1101:
        {
            if ([errCode isEqualToString:@"00000"]) {
                __weak typeof(self) weakSelf = self;
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"设置密码成功" message:@"成功" preferredStyle: UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [weakSelf XGCGMiMa];
                }]];
                [self presentViewController:alert animated:true completion:nil];
                
            }else{
                NSString *errMsg = [data objectForKey:@"errMsg"];
                [MBProgressHUD showHUDMsg:errMsg];
                
            }

        }
            break;
        default:
            break;
    }
}
//失败了
- (void)failToRequest:(LAndRRequest* )manager withData:(id)data{
    
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
    [_Text_Name resignFirstResponder];
    [_Text_Call resignFirstResponder];
    [_Text_ZhangHao resignFirstResponder];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case 2:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 6) {
                [_Text_ZhangHao becomeFirstResponder];
                return NO;
            }
        }
            break;
            
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
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.viwe1];
    [self.view addSubview:self.Lab_1];
    [self.view addSubview:self.btn];
    [_viwe1 addSubview:self.Lab_2];
    [_viwe1 addSubview:self.Lab_3];
    [_viwe1 addSubview:self.Lab_4];
    [_viwe1 addSubview:self.Text_Name];
    [_viwe1 addSubview:self.Text_Call];
    [_viwe1 addSubview:self.Text_ZhangHao];
    [_viwe1 addSubview:self.viwe2];
    [_viwe1 addSubview:self.viwe3];
    [_viwe1 addSubview:self.viwe4];
    [_viwe1 addSubview:self.btn1];
    
    _viwe1.backgroundColor = [UIColor whiteColor];
    _viwe2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _viwe3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _viwe4.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    _btn.backgroundColor = allcolor;
//    [_btn1 setTitleColor:allcolor forState:UIControlStateNormal];
    
    _Lab_1.text = @"为了方便您的使用，请设置您的密码！";
    _Lab_2.text = @"手机号";
    _Lab_3.text = @"验证码";
    _Lab_4.text = @"密    码";
    
    [_btn setTitle:@"确 定" forState:UIControlStateNormal];
    [_btn1 setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    
    _Lab_1.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
    _Lab_2.font = [UIFont systemFontOfSize:CONVER_VALUE(16)];
    _Lab_3.font = [UIFont systemFontOfSize:CONVER_VALUE(16)];
    _Lab_4.font = [UIFont systemFontOfSize:CONVER_VALUE(16)];
    
    _Text_Name.font=[UIFont fontWithName:@"Times New Roman" size:CONVER_VALUE(16)];
    _Text_Call.font=[UIFont fontWithName:@"Times New Roman" size:CONVER_VALUE(16)];
    _Text_ZhangHao.font=[UIFont fontWithName:@"Times New Roman" size:CONVER_VALUE(16)];
    
    _btn1.titleLabel.adjustsFontSizeToFitWidth = YES;
    _btn1.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(11)];
    
    
    _btn.layer.cornerRadius = CONVER_VALUE(22);
    _btn.clipsToBounds = YES;
    _btn1.layer.cornerRadius = CONVER_VALUE(10);
    _btn1.clipsToBounds = YES;
    
//    [_btn1.layer setBorderColor:allcolor.CGColor];
    [_btn1.layer setBorderWidth:1];
    [_btn1.layer setMasksToBounds:YES];
    
    [_btn addTarget:self action:@selector(loadNetWorkLogin) forControlEvents:UIControlEventTouchUpInside];
    [_btn1 addTarget:self action:@selector(loadGLZHNetWorkTime) forControlEvents:UIControlEventTouchUpInside];
    
    _btn1.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UIView *views = self.view;
    UIView *views1 = self.viwe1;
    
    switch (_style) {
        case 0:
            _Lab_1.sd_layout
            .topSpaceToView(views, 20)
            .leftSpaceToView(views, CONVER_VALUE(12))
            .rightSpaceToView(views, CONVER_VALUE(12))
            .heightIs(CONVER_VALUE(20));
            
            _viwe1.sd_layout
            .topSpaceToView(_Lab_1, 20)
            .leftSpaceToView(views, 0)
            .rightSpaceToView(views, 0)
            .heightIs(CONVER_VALUE(180));
            break;
        case 1:
            _viwe1.sd_layout
            .topSpaceToView(views, 0)
            .leftSpaceToView(views, 0)
            .rightSpaceToView(views, 0)
            .heightIs(CONVER_VALUE(180));
            break;
            
        default:
            break;
    }
    
    _btn.sd_layout
    .topSpaceToView(views1, CONVER_VALUE(20))
    .leftSpaceToView(views, CONVER_VALUE(50))
    .rightSpaceToView(views, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(44));
    
    _Lab_2.sd_layout
    .topSpaceToView(views1, CONVER_VALUE(20))
    .leftSpaceToView(views1, CONVER_VALUE(12))
    .widthIs(CONVER_VALUE(60))
    .heightIs(CONVER_VALUE(20));
    
    _Lab_3.sd_layout
    .topSpaceToView(_Lab_2, CONVER_VALUE(40))
    .leftEqualToView(_Lab_2)
    .widthIs(CONVER_VALUE(60))
    .heightIs(CONVER_VALUE(20));
    
    _Lab_4.sd_layout
    .topSpaceToView(_Lab_3, CONVER_VALUE(40))
    .leftEqualToView(_Lab_3)
    .widthIs(CONVER_VALUE(60))
    .heightIs(CONVER_VALUE(20));
    
    
    
    _Text_Name.sd_layout
    .topEqualToView(_Lab_2)
    .leftSpaceToView(_Lab_2, 10)
    .widthIs(CONVER_VALUE(200))
    .heightIs(CONVER_VALUE(20));
    
    _Text_Call.sd_layout
    .topEqualToView(_Lab_3)
    .leftSpaceToView(_Lab_3, 10)
    .widthIs(CONVER_VALUE(200))
    .heightIs(CONVER_VALUE(20));
    
    _Text_ZhangHao.sd_layout
    .topEqualToView(_Lab_4)
    .leftSpaceToView(_Lab_4, 10)
    .rightSpaceToView(views1, 10)
    .heightIs(CONVER_VALUE(20));
    
    
    _viwe2.sd_layout
    .topSpaceToView(_Lab_2, CONVER_VALUE(20))
    .leftSpaceToView(views1, CONVER_VALUE(12))
    .rightSpaceToView(views1, CONVER_VALUE(12))
    .heightIs(1);
    
    _viwe3.sd_layout
    .topSpaceToView(_Lab_3, CONVER_VALUE(20))
    .leftSpaceToView(views1, CONVER_VALUE(12))
    .rightSpaceToView(views1, CONVER_VALUE(12))
    .heightIs(1);
    
    _viwe4.sd_layout
    .topSpaceToView(_Lab_4, CONVER_VALUE(20))
    .leftSpaceToView(views1, CONVER_VALUE(12))
    .rightSpaceToView(views1, CONVER_VALUE(12))
    .heightIs(1);
    
    _btn1.sd_layout
    .topEqualToView(_Lab_3)
    .rightSpaceToView(views1, CONVER_VALUE(12))
    .leftSpaceToView(_Text_Call, CONVER_VALUE(2))
    .heightIs(CONVER_VALUE(20));
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
- (UIView *)viwe4{
    if (!_viwe4) {
        _viwe4 = [[UIView alloc]init];
        
    }
    return _viwe4;
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
- (UILabel *)Lab_4{
    if (!_Lab_4) {
        _Lab_4 = [[UILabel alloc]init];
    }
    return _Lab_4;
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
        
    }
    return _Text_Name;
}
- (UITextField *)Text_ZhangHao{
    if (!_Text_ZhangHao) {
        _Text_ZhangHao = [[UITextField alloc]init];
        _Text_ZhangHao.keyboardType = UIKeyboardTypeDefault;
        _Text_ZhangHao.placeholder = @"密码由6-16位字母、数字组合";
        _Text_ZhangHao.delegate = self;
        _Text_ZhangHao.tag = 4;
        
        _Text_ZhangHao.secureTextEntry = YES;
        _Text_ZhangHao.textAlignment = NSTextAlignmentLeft;
        
    }
    return _Text_ZhangHao;
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
