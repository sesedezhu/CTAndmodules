//
//  CTLoginCtrls2.m
//  CT实用modules
//
//  Created by chengtao on 2019/2/10.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CTLoginCtrls2.h"
#import "ModelView001.h"
#import "SeccodeView002.h"
@interface CTLoginCtrls2 ()<UITextFieldDelegate>
@property(nonatomic ,strong) UIView *TopBakView;     //上
@property(nonatomic ,strong) UIView *ContentBakView; //中
@property(nonatomic ,strong) UIView *BottomBakView;  //下

@property(nonatomic ,strong) UIButton *TopNavBtn;
@property(nonatomic ,strong) UIImageView *TopImaview;

@property(nonatomic ,strong) UIButton *ContentBtn;
@property(nonatomic ,strong) ModelView001 *ContentTextView2;
@property(nonatomic ,strong) SeccodeView002 *ContentTextTime2;

@property(nonatomic ,strong) UILabel *BottomLab;
@end

@implementation CTLoginCtrls2
#pragma mark - configuration
- (void)CTconfiguration{
    self.view.backgroundColor = CTColorWhite;
}
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    [self loadUI];
    //加载本类配置
    [self CTconfiguration];
    //添加键盘代理对象
    [self loadTextFieldDelegateObject];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
#pragma mark - 键盘代理
//为键盘代理添加对象
- (void)loadTextFieldDelegateObject{
    _ContentTextView2.Text_content.delegate = self;
    _ContentTextTime2.Text_content.delegate = self;
    
    _ContentTextView2.Text_content.tag = 2;
    _ContentTextTime2.Text_content.tag = 3;
}
//取消text第一响应，键盘消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self textresignresponders];
}
//取消text第一响应，键盘消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self textresignresponders];
    
    //按retun使密码响应
    if (textField == _ContentTextView2.Text_content) {
        [_ContentTextTime2.Text_content becomeFirstResponder];
    }
    return YES;
}
- (void)textresignresponders{
    [_ContentTextView2.Text_content resignFirstResponder];
    [_ContentTextTime2.Text_content resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    switch (textField.tag) {
        case 2:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 11) {
                [_ContentTextTime2.Text_content becomeFirstResponder];
            }
        }
            break;
            
        case 3:
        {
            NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([toBeString length] > 6) {
                textField.text = [toBeString substringToIndex:6];
                return NO;
            }
        }
            break;
        default:
            break;
    }
    return YES;
}
#pragma mark - loadUI
- (void)loadUI{
    [self.view addSubview:self.TopBakView];
    [self.view addSubview:self.ContentBakView];
    [self.view addSubview:self.BottomBakView];
    [_TopBakView addSubview:self.TopImaview];
    [_TopBakView addSubview:self.TopNavBtn];
    [_ContentBakView addSubview:self.ContentTextView2];
    [_ContentBakView addSubview:self.ContentTextTime2];
    [_ContentBakView addSubview:self.ContentBtn];
    [_BottomBakView addSubview:self.BottomLab];
    
    UIView *view = self.view;
    _TopBakView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .heightIs(CONVER_VALUE(253));
    
    _ContentBakView.sd_layout
    .topSpaceToView(_TopBakView, 0)
    .leftEqualToView(_TopBakView)
    .rightEqualToView(_TopBakView)
    .heightIs(CONVER_VALUE(218));
    
    _BottomBakView.sd_layout
    .topSpaceToView(_ContentBakView, 0)
    .leftEqualToView(_ContentBakView)
    .rightEqualToView(_ContentBakView)
    .bottomSpaceToView(view, 0);
    
    _TopImaview.sd_layout
    .topSpaceToView(_TopBakView, 0)
    .leftSpaceToView(_TopBakView, 0)
    .rightSpaceToView(_TopBakView, 0)
    .bottomSpaceToView(_TopBakView, 0);
    
    _TopNavBtn.sd_layout
    .topSpaceToView(_TopBakView, (CTStopStatusRect+CTStopNavRect)/2)
    .leftSpaceToView(_TopBakView, 16)
    .widthIs(CONVER_VALUE(38))
    .heightIs(CONVER_VALUE(30));

    _TopNavBtn.imageView.sd_layout
    .topSpaceToView(_TopNavBtn, 0)
    .leftSpaceToView(_TopNavBtn, 0)
    .widthIs(CONVER_VALUE(19))
    .heightIs(CONVER_VALUE(19));
    
    _ContentTextView2.sd_layout
    .topSpaceToView(_ContentBakView, 0)
    .leftSpaceToView(_ContentBakView, CONVER_VALUE(15))
    .rightSpaceToView(_ContentBakView, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(76));
    
    _ContentTextTime2.sd_layout
    .topSpaceToView(_ContentTextView2, 0)
    .leftEqualToView(_ContentTextView2)
    .rightEqualToView(_ContentTextView2)
    .heightIs(CONVER_VALUE(67));
    
    _ContentBtn.sd_layout
    .bottomSpaceToView(_ContentBakView, CONVER_VALUE(0))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(345))
    .heightIs(CONVER_VALUE(44));
    
    _BottomLab.sd_layout
    .topSpaceToView(_BottomBakView, CONVER_VALUE(30))
    .leftSpaceToView(_BottomBakView, 0)
    .rightSpaceToView(_BottomBakView, 0)
    .heightIs(CONVER_VALUE(12));
    
}
#pragma mark - 点击事件
- (void)loadTopNavBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadTimeBtnClick{
    [_ContentTextTime2 startTimer];
}
#pragma mark - 懒加载
- (UIView *)TopBakView{
    if (!_TopBakView) {
        _TopBakView = [CTUIManagers createView];
    }
    return _TopBakView;
}
- (UIView *)ContentBakView{
    if (!_ContentBakView) {
        _ContentBakView = [CTUIManagers createView];
    }
    return _ContentBakView;
}
- (UIView *)BottomBakView{
    if (!_BottomBakView) {
        _BottomBakView = [CTUIManagers createView];
    }
    return _BottomBakView;
}
- (UIButton *)TopNavBtn{
    if (!_TopNavBtn) {
        _TopNavBtn = [CTUIManagers createButtonNormalText:nil normalTextColor:nil font:nil backgroundColor:nil];
        [_TopNavBtn setImage:[UIImage imageNamed:@"navLetBtn2"] forState:UIControlStateNormal];
        [_TopNavBtn addTarget:self action:@selector(loadTopNavBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _TopNavBtn;
}
- (UIImageView *)TopImaview{
    if (!_TopImaview) {
        _TopImaview = [CTUIManagers createImageViewURL:nil placeholderImage:@"loginBak2"];
    }
    return _TopImaview;
}
- (UIButton *)ContentBtn{
    if (!_ContentBtn) {
        _ContentBtn = [CTUIManagers createButtonNormalText:@"登录/注册" normalTextColor:CTColorWhite font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:CTColorOrange];
        [CTUIManagers CTBtnRadius:_ContentBtn Radius:CONVER_VALUE(8)];
    }
    return _ContentBtn;
}
- (ModelView001 *)ContentTextView2{
    if (!_ContentTextView2) {
        _ContentTextView2 = [[ModelView001 alloc]init];
    }
    return _ContentTextView2;
}
- (SeccodeView002 *)ContentTextTime2{
    if (!_ContentTextTime2) {
        _ContentTextTime2 = [[SeccodeView002 alloc]init];
        [_ContentTextTime2.Btn_time addTarget:self action:@selector(loadTimeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ContentTextTime2;
}
- (UILabel *)BottomLab{
    if (!_BottomLab) {
        _BottomLab = [CTUIManagers createLabelText:@"*未注册的手机号将自动创建为我度假公寓用户" textColor:CTColorGraya font:[UIFont systemFontOfSize:CONVER_VALUE(12)] textAlignment:NSTextAlignmentCenter backgroundColor:CTColorClear];
    }
    return _BottomLab;
}
@end
