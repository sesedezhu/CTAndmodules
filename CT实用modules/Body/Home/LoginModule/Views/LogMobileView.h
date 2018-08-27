//
//  LogMobileView.h
//  CT实用modules
//
//  Created by 涛程 on 2018/8/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickButtonStateBlock)(void);
@interface LogMobileView : UIView
@property(nonatomic, copy)ClickButtonStateBlock clickButtonStateBlocks;

- (void)WarningAndHidden:(BOOL)hidden; //判断是否隐藏提示语，默认隐藏
@end
