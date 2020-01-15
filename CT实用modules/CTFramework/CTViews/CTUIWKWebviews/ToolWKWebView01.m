//
//  WKWebView01.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/12/19.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "ToolWKWebView01.h"
#import <WebKit/WebKit.h>
@interface ToolWKWebView01()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *WKView;
@property(nonatomic,copy)NSString *WKTypes;//不同进入入口类型区分
@end
@implementation ToolWKWebView01
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.WKView];
    UIView *view = self;
    _WKView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .bottomSpaceToView(view, 0);
    
//    [self loadWKWebViewWithStringURL:@"https://www.jianshu.com/p/416b84d87105" Type:nil];
//    [self loadloadWKWebViewHTMLString:@"大三大四的阿斯顿阿斯顿个阿斯顿呀啊 u 已收到u 牙刷地瓜干啥的u 呀是毒药啊素养度大关u 呀是高度压缩过毒牙素颜的噶素养的古雅说孤独呀是孤独呀gassed故意撒过的u 呀是个电影u 啊公司的u 牙膏是毒药gassedgulags读雅思过多余噶剩余的古雅说故意大帅哥u 一点噶与孤独与阿哥u 一点噶素养高待遇啊事故的古雅说的的" Type:nil];
    
}

#pragma mark - WKUIDelegate
- (void)webViewDidClose:(WKWebView *)webView {
    NSLog(@"页面关闭");
}

#pragma mark - WKNavigationDelegate
// 页面数据请求完成，开始加载网页到页面
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"当主框架的内容开始加载");
}
// 加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
// if ([_WKTypes isEqualToString:@"ToolWebview01"] || [_WKTypes isEqualToString:@"WF_QLPrivacyVCViewController"]) {
//     //修改字体大小 240%
     [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '220%'"completionHandler:nil];
// }
}
// 加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
   
}

#pragma mark - 加载wkwebView
- (void)loadWKWebViewWithStringURL:(NSString *)urlString Type:(NSString *)types {
   _WKTypes = types;
    // 对url进行检查
    if (!urlString) {
        return;
    }
    // 加载web页面
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.WKView loadRequest:request];
    
}
#pragma mark - 特殊数据加载HTMLString
- (void)loadloadWKWebViewHTMLString:(NSString *)htmlString Type:(NSString *)types{
    _WKTypes = types;
    // 对url进行检查
    if (!htmlString) {
        return;
    }
   
    [self.WKView loadHTMLString:htmlString baseURL:nil];
}
#pragma mark - 本地文件加载HTMLString
- (void)loadWKWebViewPushString:(NSString *)PushString Type:(NSString *__nullable)types{
    _WKTypes = types;
    // 对本地路径进行检查
    if (!PushString) {
        return;
    }
    NSString *bundleStr = [[NSBundle mainBundle] pathForResource:PushString ofType:@"html"];
        
    NSURL * feedbackUrl = [NSURL fileURLWithPath:bundleStr];
        
    [self.WKView loadRequest:[NSURLRequest requestWithURL:feedbackUrl]];
    
}
#pragma mark - 懒加载
- (WKWebView *)WKView{
    if (!_WKView) {
        _WKView = [[WKWebView alloc]init];
        _WKView.UIDelegate = self;
        _WKView.navigationDelegate = self;
        //允许左滑右滑，默认值为NO；设置为YES后，即可实现左右滑手势可用。
        _WKView.allowsBackForwardNavigationGestures = NO;
    }
    return _WKView;
}


@end
