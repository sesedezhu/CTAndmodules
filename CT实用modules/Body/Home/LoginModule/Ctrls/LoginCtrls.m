//
//  LoginCtrls.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/23.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LoginCtrls.h"
#import "MiMaCtrl.h"
#import "GuanLianUserCtrl.h"
#import "GLMiMaCtrl.h"
#import "IQKeyboardManager.h"
#import "NavEveryoneView.h"
@interface LoginCtrls ()<UITextFieldDelegate,UIGestureRecognizerDelegate,ZYHttpManagerDelegate,UIScrollViewDelegate>
{
 
}
@property(nonatomic ,strong) NavEveryoneView *NavView; //虚假导航条
@property(nonatomic ,strong) UIScrollView *scrollView;
@property(nonatomic ,strong) UIView *loginBakView;   //整体背景
@property(nonatomic ,strong) UIView *haedBakView;       //头部背景
@property(nonatomic ,strong) UIView *accountBakView; //账号密码背景
@property(nonatomic ,strong) UIView *mobileBakView;  //手机号背景
@end
#define allcolorAlpha(CGFloat) [UIColor  colorWithRed:85/255.00 green:210/255.00 blue:146/255.00 alpha:CGFloat]
@implementation LoginCtrls
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    //1.虚假导航条
    [self customNaviView];
    
    //2.加载UI
    [self liadUI];
}
#pragma mark - 自定义导航栏
- (void)customNaviView{
    //创建虚假导航栏
    self.NavView.frame = CGRectMake(0, 0, kScreenWidth, (CTStopStatusRect+CTStopNavRect));
    [self.view addSubview:_NavView];
    [_NavView.leftBtn addTarget:self action:@selector(popNavViewLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    _NavView.bottomLine = YES;
    [_NavView.leftBtn setTitle:@"" forState:UIControlStateNormal];
}
- (void)popNavViewLeftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 加载UI
- (void)liadUI{
    [self.view addSubview:self.loginBakView];
    [_loginBakView addSubview:self.haedBakView];
    [_loginBakView addSubview:self.scrollView];
    [_scrollView addSubview:self.accountBakView];
    [_scrollView addSubview:self.mobileBakView];
    
}
#pragma mark - 懒加载
- (NavEveryoneView *)NavView{
    if (!_NavView) {
        _NavView = [[NavEveryoneView alloc]init];
    }
    return _NavView;
}
- (UIView *)loginBakView{
    if (!_loginBakView) {
        _loginBakView = [[UIView alloc]init];
        _loginBakView.backgroundColor = [UIColor whiteColor];
    }
    return _loginBakView;
}
- (UIView *)haedBakView{
    if (!_haedBakView) {
        _haedBakView = [[UIView alloc]init];
        _haedBakView.backgroundColor = [UIColor whiteColor];
    }
    return _haedBakView;
}
- (UIView *)accountBakView{
    if (!_accountBakView) {
        _accountBakView = [[UIView alloc]init];
        _accountBakView.backgroundColor = [UIColor whiteColor];
    }
    return _accountBakView;
}
- (UIView *)mobileBakView{
    if (!_mobileBakView) {
        _mobileBakView = [[UIView alloc]init];
        _mobileBakView.backgroundColor = [UIColor whiteColor];
    }
    return _mobileBakView;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        //设置内容的宽高，这个属性决定了scrollView能否滑动
        _scrollView.contentSize = CGSizeMake(kScreenWidth*2, TRANS_VALUE(126));
        //滚动条样式
        _scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        //是否显示分页
        _scrollView.pagingEnabled = YES;
        //去掉下边滚动条
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        //内容到边界过后是否有一个反弹效果
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}
@end
