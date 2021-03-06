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
#import "InstructionView.h"
#import "WebViewCtrls.h"
#import "ToolWKWebView01.h"
#import "CTShowsManager.h"
@interface HomeViewCtrl ()

@end

@implementation HomeViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title =  @"页面封装类";
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"自定义弹窗",@"登录模型0",@"登录模块1",@"用户数据",@"WebView",@"WKWebView", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtn:sender];
    }];
    [self.view addSubview:collview];
    
    InstructionView *insview = [[InstructionView alloc]initWithFrame:CGRectMake(50, 350, 150, 50)];
    [self.view addSubview:insview];
    
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
            
//             NSString * shareText = @"分享内容";
//            UIImage * shareImage =[UIImage imageNamed:@"123"];
//              NSURL * shareURL = [NSURL URLWithString:@"http://touch.naliwan.com/act/scareDetail.html"];
//              NSArray * activityItems = [[NSArray alloc] initWithObjects:shareText, shareImage, shareURL, nil];
//              UIActivityViewController * activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
//              UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
//                        NSLog(@"%@",activityType);
//                        if (completed) {
//                            NSLog(@"分享成功");
//                        } else {
//                            NSLog(@"分享失败");
//                        }
//              [activityVC dismissViewControllerAnimated:YES completion:nil];
//                    };
//               activityVC.completionWithItemsHandler = myBlock;
//               [self presentViewController:activityVC animated:YES completion:nil];
      
            
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
        case 4:
        {
            WebViewCtrls *web = [[WebViewCtrls alloc]init];
            web.url = @"http://p.qiao.baidu.com/cps/chat?siteId=4954872&userId=7120819";
            [self.navigationController pushViewController:web animated:YES];
        }
            break;
        default:
        {
            
            ToolWKWebView01 *web = [[ToolWKWebView01 alloc]init];
            [CTShowsManager CTloadInitContViewTop:100 Left:0 Width:kScreenWidth Height:kScreenHeight-100 addView:web animationTepy:NLWMobileAndReturnBottom transparency:YES interaction:YES time:1.0];
        }
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
