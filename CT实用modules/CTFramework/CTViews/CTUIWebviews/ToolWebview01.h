//
//  ToolWebview01.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/12/13.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolWebview01 : UIView<UIWebViewDelegate>
@property(nonatomic,copy)NSString *sty;
@property(nonatomic,copy)NSString *connets;
@property(nonatomic,strong)UIWebView *referralWebView;
@end

NS_ASSUME_NONNULL_END
