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
    
    [self loadWebViewWithURL:@"https://www.jianshu.com/p/416b84d87105"];

    
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
  
}
// 加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
   
}

// 加载wkwebView
- (void)loadWebViewWithURL:(id)url {
    NSURL *loadURL = nil;
    // 对url进行检查
    if (!url) {
        return;
    }
    if ([url hasSuffix:@"html"]) { // 本地html
        NSString *path = [[NSBundle mainBundle] pathForResource:url ofType:nil]; // 如果Bundle中没有该文件会返回nil
        if (!path) {
            NSLog(@"未查找到文件: %@",url);
            return;
        }
        loadURL = [NSURL fileURLWithPath:path];
    }
    else if ([url isKindOfClass:[NSURL class]]) { // URL
        loadURL = url;
    }
    else if ([url isKindOfClass:[NSString class]]) { // URL Stirng
        [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        loadURL = [NSURL URLWithString:url];
    }
    else {
        NSLog(@"格式错误：url- %@",url);
    }
    // 加载web页面
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:loadURL];
    [self.WKView loadRequest:request];
    
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
