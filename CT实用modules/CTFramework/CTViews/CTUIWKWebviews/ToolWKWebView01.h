//
//  WKWebView01.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/12/19.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolWKWebView01 : UIView

// 对声明参数添加属性（__nullable）时参数可传nil，传（__nonnull）时参数不能为空
- (void)loadWKWebViewWithStringURL:(NSString *)urlString Type:(NSString *__nullable)types;
- (void)loadloadWKWebViewHTMLString:(NSString *)htmlString Type:(NSString *__nullable)types;
@end

NS_ASSUME_NONNULL_END
