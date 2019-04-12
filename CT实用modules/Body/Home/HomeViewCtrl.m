//
//  HomeViewCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/7/31.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "HomeViewCtrl.h"
#import "CTCollects.h"
#import "ShowsCtrls.h"
#import "OneSimpleView.h"
#import "TwoSimpleView.h"
#import "LoginCtrls.h"
#import "CTLoginCtrls2.h"
#import "CeShiCtrl.h"

@interface HomeViewCtrl ()

@end

@implementation HomeViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title =  @"页面封装类";
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"自定义弹窗",@"登录模型0",@"登录模块1",@"未知类型",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtn:sender];
    }];
    [self.view addSubview:collview];
    
    
}

- (void)ClickBtn:(UIButton *)sender{
    NSLog(@"啊！我点击了%ld",sender.tag-1);
    switch (sender.tag-1) {
        case 0:
        {
//            一、CTShows 自定义弹窗
            ShowsCtrls *login = [[ShowsCtrls alloc]init];
            [login setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:login animated:YES];
            
        }
            break;
        case 1:
        {
            CTLoginCtrls2 *login = [[CTLoginCtrls2 alloc]init];
            [login setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:login animated:YES];
        }
            break;
        case 2:
        {
            //登录模块
            LoginCtrls *login = [[LoginCtrls alloc]init];
            [login setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:login animated:YES];
           
        }
            break;
        case 3:
        {
            CeShiCtrl *login = [[CeShiCtrl alloc]init];
            [login setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:login animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
