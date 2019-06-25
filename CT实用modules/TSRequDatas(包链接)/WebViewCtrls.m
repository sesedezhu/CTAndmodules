//
//  WebViewCtrls.m
//  HaiBa
//
//  Created by 涛程 on 2017/8/15.
//  Copyright © 2017年 涛程. All rights reserved.
//
#define kScreenSize           [[UIScreen mainScreen] bounds].size
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height


#define kCurrentModeSize        [[UIScreen mainScreen] currentMode].size
#define kEqualToSize(x, y)      CGSizeEqualToSize(CGSizeMake(x, y), kCurrentModeSize)
// 判断是否是ipad
#define is_Pad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(640, 960) && !is_Pad : NO)
// 判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(640, 1136) && !is_Pad : NO)
// 判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(750, 1334) && !is_Pad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(1242, 2208) && !is_Pad : NO)
// 判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(1125, 2436) && !is_Pad : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(828, 1792) && !is_Pad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(1125, 2436) && !is_Pad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(1242, 2688) && !is_Pad : NO)
//判断是iphoneX系列
#define IS_IPHONE_LH (IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES)
//状态栏高度
#define Height_StatusBar IS_IPHONE_LH ? 44.0 : 20.0
//导航栏高度(包括状态栏)
#define Height_NavBar IS_IPHONE_LH ? 88.0 : 64.0
//TabBar高度
#define Height_TabBar IS_IPHONE_LH ? 83.0 : 49.0
//底部安全距离
#define TabbarSafeBottomMargin (IS_IPHONE_LH ? 34.f : 0.f)



//写死状态栏高度
#define CTStopStatusRect  (kScreenHeight== 812.0 ? 44 : 20)
//写死导航栏高度
#define CTStopNavRect     (kScreenHeight== 812.0 ? 44 : 44)
/*--TabBar的高度----*/
#define CTStopTabBarRect  (kScreenHeight== 812.0 ? 83 : 49)

#define isIPhoneX (kScreenHeight == 812.0 ? 1 : 0)


//判断系统版本是否大于9.0
#define ABOVE_IOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)
#define ABOVE_IOS11 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) ? YES : NO)

//以640为设计稿 -------本项目以640*320为模型
#define TRANS_VALUE(x) ceil(kScreenWidth * x / 320)
//以750为设计稿--原始高度为667
//#define CONVER_VALUE(x) ceil(kScreenWidth * x / 375)
#define CONVER_VALUE(x) ceil(x)

#import "WebViewCtrls.h"

//#import "MJRefresh.h"
@interface WebViewCtrls ()<UIWebViewDelegate>
@property (nonatomic, strong) UIButton * LeftButton;  //上一页按钮
@property (nonatomic, strong) UIWebView *webview;
@end

@implementation WebViewCtrls
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [MBProgressHUD hideHUD];   //取消风火轮

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建请求
    _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    __weak UIWebView *webView = self.webview;
    webView.delegate = self;
    //设置为yes让h5页面适配手机
    [webView setScalesPageToFit:YES];
    [self.view addSubview:webView];
//    self.navigationItem.title = _URLtitle;
//    NSLog(@"_URLtitle ========== %@",_URLtitle);
    //发送请求
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [webView loadRequest:request];
    webView.backgroundColor = [UIColor whiteColor];
    //刷新方法
//    self.webview.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        //删除旧的
//        [webView reload];
//        //加载新的
//        [webView loadRequest:request];
//    }];
    // 马上进入刷新状态
//    [webView.scrollView.mj_header beginRefreshing];
}
#pragma mark –webViewDelegate
-(BOOL)webView:(UIWebView* )webView shouldStartLoadWithRequest:(NSURLRequest* )request navigationType:(UIWebViewNavigationType)navigationType
{
    //3.1网页加载之前会调用此方法
    
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //3.2开始加载网页调用此方法
//    MBHUDImage_Default;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [MBProgressHUD hideHUD];
//    self.navigationItem.title =  [_webview stringByEvaluatingJavaScriptFromString:@"document.title"];
//    //判断是否在刷新
//    if ([self.webview.scrollView.mj_header isRefreshing]) {
//        //加载完成结束刷新
//        [self.webview.scrollView.mj_header endRefreshing];
//    }
}

-(void)webView:(UIWebView* )webView didFailLoadWithError:(NSError* )error
{
//    [MBProgressHUD hideHUD];
    //3.6网页加载失败 调用此方法
    //判断是否在刷新
//    if ([self.webview.scrollView.mj_header isRefreshing]) {
//        //加载完成结束刷新
//        [self.webview.scrollView.mj_header endRefreshing];
//    }
}

//用苹果自带的返回键按钮处理如下(自定义的返回按钮)
//- (void)back:(UIBarButtonItem *)btn
//{
//    if ([self.webview canGoBack]) {
//        [self.webview goBack];
//
//    }else{
//        [self.view resignFirstResponder];
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
