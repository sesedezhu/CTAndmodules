//
//  ConfigurationHeader.h
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#ifndef ConfigurationHeader_h
#define ConfigurationHeader_h

/*--适配相关----*/
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//以640为设计稿
#define TRANS_VALUE(x) ceil(kScreenWidth * x / 320)
//以750为设计稿
#define CONVER_VALUE(x) ceil(kScreenWidth * x / 375)


//导航栏高度(包括状态栏)
#define Height_NavBar (IS_IPHONE_LH ? 88.0 : 64.0)
//状态栏高度
#define CTStopStatusRect (IS_IPHONE_LH ? 44.0 : 20.0)
//导航栏高度(包括状态栏)
#define CTStopNavRect (IS_IPHONE_LH ? 88.0 : 64.0)
//TabBar高度
#define CTStopTabBarRect (IS_IPHONE_LH ? 83.0 : 49.0)
//底部安全距离
#define TabbarSafeBottomMargin (IS_IPHONE_LH ? 34.f : 0.f)

//写死状态栏高度
//#define CTStopStatusRect  (kScreenHeight== 812.0 ? 44 : 20)
////写死导航栏高度
//#define CTStopNavRect     (kScreenHeight== 812.0 ? 44 : 44)
////写死的TabBar的高度
//#define CTStopTabBarRect  (kScreenHeight== 812.0 ? 83 : 49)
//写死的判断是否为ipon x
//#define IS_IPHONE_LH (kScreenHeight == 812.0 ? 1 : 0)

/*--系统相关----*/
//判断系统版本是否大于9.0
#define ABOVE_IOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)
//判断系统版本是否大于13.0
#define ABOVE_IOS13 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 13.0) ? YES : NO)
/*--颜色相关----*/
//颜色
#define allcolorAlphasCT(r,g,b,CGFloat)  [UIColor  colorWithRed:r/255.00 green:g/255.00 blue:b/255.00 alpha:CGFloat]

/*--支持相关----*/
//弹框，后期会整合起来
#define tankuangTitle(x,y)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:x message:y delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];[alert show]

//风火轮
#define MBHUD_Start(x) [MBProgressHUD showCustomGifHUD:((x == 0)?@"加载中":x) imageName:@"fenghuolun"]
#define MBHUD_Warning(x)   [MBProgressHUD showHUDMsg:((x == 0)?@"加载完成":x)];
#define MBHUD_End      [MBProgressHUD hideHUD];


#define kCurrentModeSize        [[UIScreen mainScreen] currentMode].size
#define kEqualToSize(x, y)      CGSizeEqualToSize(CGSizeMake(x, y), kCurrentModeSize)
// 判断是否是ipad
#define is_Pad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(640, 960) && !is_Pad : NO)
// 判断iPhone5/se系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(640, 1136) && !is_Pad : NO)
// 判断iPhone6/7/8系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  kEqualToSize(750, 1334) && !is_Pad : NO)
//判断iphone6+/7+/8+系列
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


#endif /* ConfigurationHeader_h */
