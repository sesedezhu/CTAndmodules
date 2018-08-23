//
//  GLMiMaCtrl.m
//  HaiBa
//
//  Created by 涛程 on 2017/8/25.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "GLMiMaCtrl.h"
//#import "JDXQCtrl.h"
@interface GLMiMaCtrl ()<UITextFieldDelegate,UIGestureRecognizerDelegate,ZYHttpManagerDelegate>
@property(nonatomic ,strong) UIView *viwe1;
@property(nonatomic ,strong) UIView *viwe2;
@property(nonatomic ,strong) UIView *viwe3;


@property(nonatomic ,strong) UILabel *Lab_1;
@property(nonatomic ,strong) UILabel *Lab_2;


@property(nonatomic ,strong) UIButton *btn;

@property(nonatomic ,strong) UITextField *Text_ZhangHao;

//网络请求
@property (nonatomic ,retain)LAndRRequest *manager;
@property(nonatomic,retain)NSMutableDictionary *messageDic;

@end

@implementation GLMiMaCtrl
#pragma mark - 导航返回按钮功能
//一、
- (void)GLMiMaNavBarPopCtrls{
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc]initWithTitle:nil style:UIBarButtonItemStyleDone target:self action:@selector(GLMiMaNavBarButtonAction)];
    backButton.image = [UIImage imageNamed:@"FH0056"];
    self.navigationItem.leftBarButtonItem=backButton;
}
//二、
- (void)GLMiMaNavBarButtonAction{
    __weak typeof(self) weakSelf = self;
//    [NLWNavigatPOP NLW_NavigatPOPDoor:_Nav_Pop_Door andType:_Nav_Pop_Type andClass:@"GLMiMaCtrl" Block:^(__unsafe_unretained Class PopCtrl, int styles) {
//        [weakSelf GLMiMaFanhuiDoor:_Nav_Pop_Door Type:_Nav_Pop_Type clss:PopCtrl style:styles];
//    }];
}
//三、返回抢购
- (void)GLMiMaFanhuiDoor:(int)Door Type:(int)Type clss:(Class)PopCtrl style:(int)styles{
    switch (styles) {
        case 1://我的页面-----------------------------------
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        default://默认返回上一页
        {
            [self GLMiMaPopViewControllerAnimatedYes];
            
        }
            break;
    }
}
//四、默认返回上一页
- (void)GLMiMaPopViewControllerAnimatedYes{
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
//发送登录请求
- (void)loadNetWorkLogin{
    
    
    
    if ((_Text_ZhangHao.text.length != 0) ) {
        BOOL a = [self judgePassWordLegal:_Text_ZhangHao.text];
        
        if (!a) {
            [MBProgressHUD showHUDMsg:@"密码输入格式不正确"];
            return;
        }
        
    }else{
        [MBProgressHUD showHUDMsg:@"账号不能为空"];
        return;
    }
    
    
//    MBHUD;
    
    NSString *md5Str;
    NSString *md5;
    
    if (_userId && ![_userId isEqualToString:@""] && (_userId.length != 0)){
        
    }
    NSString * mimamd5 = [LCMD5Tool MD5ForLower32Bate:_Text_ZhangHao.text];
    
    self.manager=[[LAndRRequest alloc]init];
    _manager.delegate=self;
    
    self.messageDic = [[NSMutableDictionary alloc]init];

    [_messageDic setObject:_userId forKey:@"userId"];
    [_messageDic setObject:mimamd5 forKey:@"password"];
    
    md5Str = [NSString stringWithFormat:@"%@%@naliwan",mimamd5,_userId];
    md5 = [LCMD5Tool MD5ForUpper32Bate:md5Str];
    [_messageDic setObject:md5 forKey:@"sign"];
    
//    [_manager startPostConnectionWithPath:NLWSetUserPwd parameter:_messageDic CaCha:NO];
    
}
#pragma mark - 请求成功回调处理
//缓存数据
- (void)CaChaToRequest:(LAndRRequest* )manager withData:(id)data{
}
//成功了
- (void)successToRequest:(LAndRRequest* )manager withData:(id)data{
    [MBProgressHUD hideHUD];
    NSString *errCode = [data objectForKey:@"errCode"];
    if ([errCode isEqualToString:@"00000"]) {
        if (_jdxqlog == 2) {
//            UserDefaul2(@"2", UserJDXQ);
            for (UIViewController *controller in self.navigationController.viewControllers) {
//                if ([controller isKindOfClass:[JDXQCtrl class]]) {
                    [self.navigationController popToViewController:controller animated:YES];
//                }
            }
        }else{
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
       
    }else{
        NSString *errMsg = [data objectForKey:@"errMsg"];
        [MBProgressHUD showHUDMsg:errMsg];
        
    }
    
}
//失败了
- (void)failToRequest:(LAndRRequest* )manager withData:(id)data{
    
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
   
    [_Text_ZhangHao resignFirstResponder];
    
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
            
        default:
            break;
    }
    return YES;
}

#pragma mark - UI
- (void)loadGLUSerUI{
    self.navigationItem.title = @"设置密码";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.viwe1];
    [self.view addSubview:self.Lab_1];
    [self.view addSubview:self.btn];
    [_viwe1 addSubview:self.Lab_2];
   
    [_viwe1 addSubview:self.Text_ZhangHao];
    [_viwe1 addSubview:self.viwe2];
    [_viwe1 addSubview:self.viwe3];
    
    
    _viwe1.backgroundColor = [UIColor whiteColor];
    _viwe2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _viwe3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _Lab_1.textColor = [UIColor grayColor];
//    _btn.backgroundColor = allcolor;
    
    
    _Lab_1.text = @"为了方便您的使用，请设置您的密码！";
    _Lab_2.text = @"密    码";
  
    
    [_btn setTitle:@"确 定" forState:UIControlStateNormal];

    
    
    _Lab_1.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
    _Lab_2.font = [UIFont systemFontOfSize:CONVER_VALUE(11)];
    
    _Text_ZhangHao.font=[UIFont fontWithName:@"Times New Roman" size:CONVER_VALUE(11)];
    
   
    
    
    _btn.layer.cornerRadius = CONVER_VALUE(22);
    _btn.clipsToBounds = YES;
   
    
   
    
    [_btn addTarget:self action:@selector(loadNetWorkLogin) forControlEvents:UIControlEventTouchUpInside];
   
    
    
    UIView *views = self.view;
    UIView *views1 = self.viwe1;
    
    
    _Lab_1.sd_layout
    .topSpaceToView(views, 20)
    .leftSpaceToView(views, CONVER_VALUE(12))
    .rightSpaceToView(views, CONVER_VALUE(12))
    .heightIs(CONVER_VALUE(20));
    
    _viwe1.sd_layout
    .topSpaceToView(_Lab_1, 20)
    .leftSpaceToView(views, 0)
    .rightSpaceToView(views, 0)
    .heightIs(CONVER_VALUE(60));
    
    
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
    
    _Text_ZhangHao.sd_layout
    .topEqualToView(_Lab_2)
    .leftSpaceToView(_Lab_2, 10)
    .widthIs(CONVER_VALUE(200))
    .heightIs(CONVER_VALUE(20));
    
    _viwe2.sd_layout
    .topSpaceToView(_Lab_2, CONVER_VALUE(20))
    .leftSpaceToView(views1, CONVER_VALUE(12))
    .rightSpaceToView(views1, CONVER_VALUE(12))
    .heightIs(1);
    
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


- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]init];
    }
    return _btn;
}



- (UITextField *)Text_ZhangHao{
    if (!_Text_ZhangHao) {
        _Text_ZhangHao = [[UITextField alloc]init];
//        _Text_ZhangHao.keyboardType = UIKeyboardTypeNumberPad;
        _Text_ZhangHao.placeholder = @"密码由6-16位字母、数字组合";
        _Text_ZhangHao.delegate = self;
        _Text_ZhangHao.tag = 4;
        
        _Text_ZhangHao.secureTextEntry = YES;
        _Text_ZhangHao.textAlignment = NSTextAlignmentLeft;
        
    }
    return _Text_ZhangHao;
}



@end
