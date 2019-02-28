//
//  SuccessfulCtrl001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/27.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "PayResultsCtrl001.h"
#import "CTPayView001.h"
@interface PayResultsCtrl001 ()
@property(nonatomic ,strong) CTPayView001 *HeaderView;
@end

@implementation PayResultsCtrl001
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self loadConfiguration];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadFailureConfigurationView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
#pragma mark - 本页配置
- (void)loadConfiguration{
    UIButton *backBut = [UIButton buttonWithType:UIButtonTypeCustom];
    backBut.frame = CGRectMake(0, 0,30, 25);
    [backBut setTitle:@"  " forState:UIControlStateNormal];
    [backBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBut setImage:[UIImage imageNamed:@"MyBkB002"] forState:UIControlStateNormal];
    backBut.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [backBut addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemBut = [[UIBarButtonItem alloc] initWithCustomView:backBut];
    self.navigationItem.leftBarButtonItem = itemBut;
    
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadSuccessfulConfigurationView{//成功配置页面
    self.navigationItem.title =  @"支付成功";
    _HeaderView.PayImage.image = [UIImage imageNamed:@"CTPaySuccessful001"];
    _HeaderView.LabWarning.hidden = YES;
    [_HeaderView.LeftBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [_HeaderView.RightBtn setTitle:@"查看订单" forState:UIControlStateNormal];
    _HeaderView.LabResults.text = @"支付成功";
    [_HeaderView.LeftBtn addTarget:self action:@selector(loadLeftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_HeaderView.RightBtn addTarget:self action:@selector(loadRightBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)loadFailureConfigurationView{//失败配置页面
    self.navigationItem.title =  @"支付失败";
    _HeaderView.PayImage.image = [UIImage imageNamed:@"CTPayFailure001"];
    [_HeaderView.LeftBtn setTitle:@"继续支付" forState:UIControlStateNormal];
    [_HeaderView.LeftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _HeaderView.LeftBtn.backgroundColor = allcolorAlphasCT(241, 96, 39, 1.0);
    [_HeaderView.RightBtn setTitle:@"查看订单" forState:UIControlStateNormal];
    _HeaderView.LabResults.text = @"支付失败";
    [_HeaderView.LeftBtn addTarget:self action:@selector(loadLeftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_HeaderView.RightBtn addTarget:self action:@selector(loadRightBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - loadUI
- (void)loadUI{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.HeaderView];
}
#pragma mark - 点击事件
- (void)loadLeftBtnClick{
    
}
- (void)loadRightBtnClick{
    
}
#pragma mark - 懒加载
- (CTPayView001 *)HeaderView{
    if (!_HeaderView) {
        _HeaderView = [[CTPayView001 alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, CONVER_VALUE(293))];
    }
    return _HeaderView;
}

@end
