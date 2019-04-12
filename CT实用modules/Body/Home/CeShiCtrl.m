//
//  CeShiCtrl.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/4/12.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "CeShiCtrl.h"
#import "CTLoginRequest001.h"
@interface CeShiCtrl ()
{
    NSString *_yanzhengma;
}
@end

@implementation CeShiCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [CTUIManagers createButtonNormalText:@"账号登录" normalTextColor:[UIColor blueColor] font:nil backgroundColor:nil];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [CTUIManagers createButtonNormalText:@"获取验证码" normalTextColor:[UIColor blueColor] font:nil backgroundColor:nil];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [CTUIManagers createButtonNormalText:@"手机号登录" normalTextColor:[UIColor blueColor] font:nil backgroundColor:nil];
    [self.view addSubview:btn3];
    
    btn1.sd_layout
    .topSpaceToView(self.view, 100)
    .leftSpaceToView(self.view, 100)
    .widthIs(200)
    .heightIs(100);
    
    btn2.sd_layout
    .topSpaceToView(btn1, 100)
    .leftSpaceToView(self.view, 100)
    .widthIs(200)
    .heightIs(100);

    btn3.sd_layout
    .topSpaceToView(btn2, 100)
    .leftSpaceToView(self.view, 100)
    .widthIs(200)
    .heightIs(100);

    [btn1 addTarget:self action:@selector(loadzhanghao) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(loadyanzhengma) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(loadshoujihao) forControlEvents:UIControlEventTouchUpInside];
}
//账号密码
- (void)loadzhanghao{
    [CTLoginRequest001 getRequestUserAccount:@"18789281990" password:@"a123456" success:^(id  _Nonnull responseObject) {
        NSLog(@"账号密码请求成功");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"账号密码请求s失败");
    }];
}
//验证码
- (void)loadyanzhengma{
    [CTLoginRequest001 getVerificationCodeMobile:@"18789281990" success:^(id  _Nonnull responseObject) {
        NSLog(@"验证码请求成功");
        NSString *errCode = [responseObject objectForKey:@"errCode"];
        if ([errCode isEqualToString:@"00000"]) {
            NSDictionary *UserDic = responseObject[@"data"];
            self->_yanzhengma = UserDic[@"msgInfo"];
        }else{
            NSString *errMsg = [responseObject objectForKey:@"errMsg"];
            [MBProgressHUD showHUDMsg:errMsg];
        }
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"验证码请求失败");
    }];
}
//手机号
- (void)loadshoujihao{
    [CTLoginRequest001 getRequestUserMobile:@"18789281990" MsgInfo:_yanzhengma success:^(id  _Nonnull responseObject) {
        NSLog(@"手机号请求成功");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"手机号请求失败");
    }];
}
@end
