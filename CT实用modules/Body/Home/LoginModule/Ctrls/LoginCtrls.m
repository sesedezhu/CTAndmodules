//
//  LoginCtrls.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/23.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LoginCtrls.h"
#import "NavView001.h"
#import "LogHaedView.h"
#import "LogBottomView.h"
#import "LogAccountView.h"
#import "LogMobileView.h"
#import "IQKeyboardManager.h"
#import "GuanLianUserCtrl.h"
#import "GLMiMaCtrl.h"
#import "MiMaCtrl.h"
@interface LoginCtrls ()<UITextFieldDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    NSString *_msgInfo; //验证码

}
@property(nonatomic ,strong) NavView001 *NavView; //虚假导航条
@property(nonatomic ,strong) UIScrollView *logScrollViews;
@property(nonatomic ,strong) UIView *loginBakView;   //整体背景
@property(nonatomic ,strong) LogHaedView *logHaedViews;       //头部背景
@property(nonatomic ,strong) LogAccountView *accountBakView; //账号密码背景
@property(nonatomic ,strong) LogMobileView *mobileBakView;  //手机号背景
@property(nonatomic ,strong) LogBottomView *logBottomViews;  //微信背景
@property(nonatomic ,strong) UIButton *loginBtn;     //登录按钮

@property(nonatomic,strong)GuanLianUserCtrl *GuanLian;//关联账号页面

@end
@implementation LoginCtrls
#pragma mark - viewDidLoad
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    MBHUD_End;
    [self textresignresponders];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CTColorGroupTableViewBackground;
    
    //1.加载UI
    [self liadUI];
    //2.虚假导航条
    [self customNaviView];
    //3.加载点击事件
    [self loadClickEvent];
    //4.添加键盘代理对象
    [self loadTextFieldDelegateObject];
}
#pragma mark - 自定义导航栏
- (void)customNaviView{
    //创建虚假导航栏
    self.NavView.frame = CGRectMake(0, 0, kScreenWidth, (CTStopStatusRect+CTStopNavRect));
    [self.view addSubview:_NavView];
    
    [_NavView.leftBtn addTarget:self action:@selector(popNavViewLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    _NavView.bottomLine = YES;
    [_NavView leftButtonTextAndSelected:NO];
    
    _NavView.title.text = @"登陆";
    self.navigationItem.title = @"";
    
}
- (void)popNavViewLeftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 加载UI
- (void)liadUI{
    [self.view addSubview:self.loginBakView];
    [_loginBakView addSubview:self.logHaedViews];
    [_loginBakView addSubview:self.logScrollViews];
    [_logScrollViews addSubview:self.accountBakView];
    [_logScrollViews addSubview:self.mobileBakView];
    [_loginBakView addSubview:self.logBottomViews];
    [_loginBakView addSubview:self.loginBtn];
    
    self.view.backgroundColor = CTColorWhite;
    _loginBakView.backgroundColor = CTColorWhite;
    _accountBakView.backgroundColor = CTColorClear;
    _logHaedViews.backgroundColor = CTColorClear;
    _mobileBakView.backgroundColor = CTColorClear;
    _logBottomViews.backgroundColor = CTColorClear;
    _loginBtn.backgroundColor = CTColorClear;
    
    UIView *view = self.view;
    _loginBakView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .bottomSpaceToView(view, 0)
    .rightSpaceToView(view, 0);
    
    _logHaedViews.sd_layout
    .topSpaceToView(_loginBakView, CTStopStatusRect+CTStopNavRect+CONVER_VALUE(14))
    .leftSpaceToView(_loginBakView, 0)
    .rightSpaceToView(_loginBakView, 0)
    .heightIs(CONVER_VALUE(20));
    
    _logScrollViews.sd_layout
    .topSpaceToView(_logHaedViews, CONVER_VALUE(40))
    .leftEqualToView(_logHaedViews)
    .widthIs(kScreenWidth)
    .heightIs(CONVER_VALUE(164));
    
    _loginBtn.sd_layout
    .topSpaceToView(_logScrollViews, CONVER_VALUE(27))
    .leftSpaceToView(_loginBakView, CONVER_VALUE(52))
    .rightSpaceToView(_loginBakView, CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(38));
    
    _logBottomViews.sd_layout
    .bottomSpaceToView(_loginBakView, CTStopTabBarRect - CONVER_VALUE(6))
    .leftSpaceToView(_loginBakView, 0)
    .rightSpaceToView(_loginBakView, 0)
    .heightIs(CONVER_VALUE(30));
    
    _mobileBakView.sd_layout
    .topSpaceToView(_logScrollViews, 0)
    .leftSpaceToView(_logScrollViews, 0)
    .widthIs(kScreenWidth)
    .bottomSpaceToView(_logScrollViews, 0);
    
    _accountBakView.sd_layout
    .topSpaceToView(_logScrollViews, 0)
    .leftSpaceToView(_mobileBakView, 0)
    .widthIs(kScreenWidth)
    .bottomSpaceToView(_logScrollViews, 0);
    
}
#pragma mark - 点击事件方法集合
- (void)loadClickEvent{
    //加载头部切换方法
    [self loadHaedSwitchBtnSelected];
    //加载第三方微信登陆
    [self loadLoginWX];
    //加载按钮点击登陆方法
    [self loadLonginButton];
    //获取验证码按钮点击方法
    [self loadVerification];
}
//登录方式切换方法
- (void)loadHaedSwitchBtnSelected{
    [_logHaedViews.LeftBtn addTarget:self action:@selector(lanShouJiHao) forControlEvents:UIControlEventTouchUpInside];
    [_logHaedViews.RightBtn addTarget:self action:@selector(lanZhangHaoMiMa) forControlEvents:UIControlEventTouchUpInside];
}
//左滑
- (void)lanShouJiHao{
    if (!_logHaedViews.LeftBtn.selected) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.4  animations:^{
            [weakSelf logHaedViewsSwitchRightBottenSelected:NO];
        }];
    }
}
//右滑
- (void)lanZhangHaoMiMa{
    if (!_logHaedViews.RightBtn.selected) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.4  animations:^{
            [weakSelf logHaedViewsSwitchRightBottenSelected:YES];
        }];
    }
}
- (void)logHaedViewsSwitchRightBottenSelected:(BOOL)selected{
    [self.logHaedViews SwitchRightBottenSelected:selected];
    if (selected) {
        self.logScrollViews.contentOffset=CGPointMake(kScreenWidth, 0);
    }else{
        self.logScrollViews.contentOffset=CGPointMake(0, 0);
    }
}
//微信登陆方法
- (void)loadLoginWX{
    [_logBottomViews.WXBtn addTarget:self action:@selector(WxClickEvent) forControlEvents:UIControlEventTouchUpInside];
}
- (void)WxClickEvent{
    MBHUD_Warning(@"微信登陆成功");
}
//按钮登陆方法
- (void)loadLonginButton{
    [_loginBtn addTarget:self action:@selector(loadNetWorkLogin) forControlEvents:UIControlEventTouchUpInside];
}
//验证码按钮点击事件
- (void)loadVerification{
    __weak typeof(self) weakSelf = self;
    _mobileBakView.clickButtonStateBlocks = ^{
        NSLog(@"发送验证码请求");
        [weakSelf loadNetWorkTime];
    };
}
- (void)loadNetWorkTime{
    MBHUD_Warning(@"获取验证码成功");
    //gcd倒计时，一次性
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //结束倒计时
        [_mobileBakView EndTimer];
    });
}
//发送登陆请求，手机号或者账号密码登陆
- (void)loadNetWorkLogin{
    //判断是否响应登陆请求
    if (_logHaedViews.LeftBtn.selected) {//手机号码
        if (![_mobileBakView.Text_Check.text isEqualToString:_msgInfo] || !(_mobileBakView.Text_Mobile.text.length == 11)) {
            [_mobileBakView WarningAndHidden:NO];
            return;
        }
    }else{//账号密码登陆
        _accountBakView.Text_ZhangHao.text = [CTStringTool CTRemoveStrEmpty:_accountBakView.Text_ZhangHao.text];
        if ((_accountBakView.Text_ZhangHao.text.length == 0)) {
            [MBProgressHUD showHUDMsg:@"账号不能为空"];
            return;
        }
    }
    //允许响应，发送请求
    MBHUD_Warning(@"登陆成功");
    
    if (_logHaedViews.LeftBtn.selected) {
        [self pushNextCtrlJudgeNewUser:@"1"];//手机号登陆
    }else{
        [self pushNextCtrlMobile:@"不等于11位手机号"];//账号密码登陆
    }
    [_accountBakView WarningAndHidden:NO];
    [_mobileBakView WarningAndHidden:NO];
}
//跳转进入忘记密码页面
- (void)pushMiMaCtrl{
    MiMaCtrl *miam = [[MiMaCtrl alloc]init];
    miam.NavTitle = @"忘记密码";
    [self.navigationController pushViewController:miam animated:YES];
}
//新用户判断
- (void)pushNextCtrlJudgeNewUser:(NSString *)is_new_user{

    int new_user = [is_new_user intValue];
    if (new_user == 1){//新用户，进入关联密码页面
        NSLog(@"进入关联密码页面");
        GLMiMaCtrl *miam = [[GLMiMaCtrl alloc]init];
        [self.navigationController pushViewController:miam animated:YES];
       
    }else{//非新用户，返回上一页
        NSLog(@"成功，返回上一页");
        [self.navigationController popViewControllerAnimated:YES];

    }
}
//判断手机号是否正确
- (void)pushNextCtrlMobile:(NSString *)mobile{

    
    if (!(mobile.length == 11)){//手机号不为11位，跳入关联账户页面并删除本控制器
        NSLog(@"进入关联账户");
        _GuanLian = [[GuanLianUserCtrl alloc]init];
        _GuanLian.NavTitle = @"关联账号";
        [self.navigationController pushViewController:_GuanLian animated:YES];
      
    }else{
        BOOL mobilebool = [CTStringTool deptNumInputShouldNumber:mobile];//判断手机号是否为全数字
        if (mobilebool) {//纯数字
            NSLog(@"成功，返回上一页");
            [self.navigationController popViewControllerAnimated:YES];
        }else{//手机号不为纯数字，跳入关联账户页面并删除本控制器
            NSLog(@"进入关联账户");
            _GuanLian = [[GuanLianUserCtrl alloc]init];
            _GuanLian.NavTitle = @"关联账号";
            [self.navigationController pushViewController:_GuanLian animated:YES];
          
        }
    }
}

#pragma mark - scrollViewDecele
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"已经停止减速");
    
    //contentOffset是UIScrollView的偏移量, contentOffset和contentSize有关, 用偏移量除以scrollView的frame的宽度得到当前页码
    int x = scrollView.contentOffset.x;
    if (x < kScreenWidth) {
        [self.logHaedViews SwitchRightBottenSelected:NO];
    }else{
        [self.logHaedViews SwitchRightBottenSelected:YES];
    }
}
#pragma mark - 键盘代理
//为键盘代理添加对象
- (void)loadTextFieldDelegateObject{
    _mobileBakView.Text_Mobile.delegate = self;
    _mobileBakView.Text_Check.delegate = self;
    _accountBakView.Text_ZhangHao.delegate = self;
    _accountBakView.Text_MiMa.delegate = self;
    
    _mobileBakView.Text_Mobile.tag = 3;
    _mobileBakView.Text_Check.tag = 2;
    _accountBakView.Text_ZhangHao.tag = 4;
    _accountBakView.Text_MiMa.tag = 5;
}
//取消text第一响应，键盘消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self textresignresponders];
}
//取消text第一响应，键盘消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self textresignresponders];
    
    //按retun使密码响应
    if (textField == _accountBakView.Text_ZhangHao) {
        [_accountBakView.Text_MiMa becomeFirstResponder];
    }
    return YES;
}
- (void)textresignresponders{
    [_mobileBakView.Text_Mobile resignFirstResponder];
    [_mobileBakView.Text_Check resignFirstResponder];
    [_accountBakView.Text_ZhangHao resignFirstResponder];
    [_accountBakView.Text_MiMa resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case 2:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 6) {
                textField.text = [toBeString substringToIndex:6];
                return NO;
            }
        }
            break;
            
        case 3:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 11) {
                [_mobileBakView.Text_Check becomeFirstResponder];
            }
        }
            break;
            
        case 4:
        {
            
        }
            break;
            
        case 5:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 16) {
                textField.text = [toBeString substringToIndex:16];
                return NO;
            }
        }
            break;
        default:
            break;
    }
    return YES;
}
#pragma mark - 懒加载
- (NavView001 *)NavView{
    if (!_NavView) {
        _NavView = [[NavView001 alloc]init];
    }
    return _NavView;
}
- (UIView *)loginBakView{
    if (!_loginBakView) {
        _loginBakView = [[UIView alloc]init];
    }
    return _loginBakView;
}
- (LogHaedView *)logHaedViews{
    if (!_logHaedViews) {
        _logHaedViews = [[LogHaedView alloc]init];
    }
    return _logHaedViews;
}
- (LogAccountView *)accountBakView{
    if (!_accountBakView) {
        _accountBakView = [[LogAccountView alloc]init];
        [_accountBakView.Btn_Warning addTarget:self action:@selector(pushMiMaCtrl) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountBakView;
}
- (LogMobileView *)mobileBakView{
    if (!_mobileBakView) {
        _mobileBakView = [[LogMobileView alloc]init];
    }
    return _mobileBakView;
}
- (UIScrollView *)logScrollViews{
    if (!_logScrollViews) {
        _logScrollViews = [[UIScrollView alloc]init];
        //设置内容的宽高，这个属性决定了scrollView能否滑动
        _logScrollViews.contentSize = CGSizeMake(kScreenWidth*2, CONVER_VALUE(158));
        //滚动条样式
        _logScrollViews.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        //是否显示分页
        _logScrollViews.pagingEnabled = YES;
        //去掉下边滚动条
        [_logScrollViews setShowsHorizontalScrollIndicator:NO];
        //内容到边界过后是否有一个反弹效果
        _logScrollViews.bounces = NO;
        _logScrollViews.delegate = self;
    }
    return _logScrollViews;
}
- (LogBottomView *)logBottomViews{
    if (!_logBottomViews) {
        _logBottomViews = [[LogBottomView alloc]init];
    }
    return _logBottomViews;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"Login_LogBtnBack"] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:CONVER_VALUE(18)];
        [_loginBtn setTitleColor:allcolorAlphasCT(255, 255, 255, 1.0) forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = CONVER_VALUE(5);//半径大小
        _loginBtn.layer.masksToBounds = YES;//是否切割
    }
    return _loginBtn;
}



@end
