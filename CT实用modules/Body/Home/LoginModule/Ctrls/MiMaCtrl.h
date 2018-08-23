//
//  MiMaCtrl.h
//  HaiBa
//
//  Created by 涛程 on 2017/8/25.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiMaCtrl : UIViewController
@property (nonatomic, copy)   NSString * NavTitle;  //导航栏标题
@property (nonatomic, assign) int style;   //必填 0有header，1没有

@property (nonatomic, copy)   NSString * remarkInfo;  //短信模板（3:手机密码找回）
@property (nonatomic, copy)   NSString * modifyFlag;  //方式 1:修改密码 2:找回密码
@end
