//
//  CTShowView.h
//  订单模版
//
//  Created by 涛程 on 2018/4/25.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
//NS_ENUM，定义状态等普通枚举
typedef NS_ENUM(NSUInteger, NLWAnimationMode) {
    NLWDefault = 0,                   //默认动画，原地隐藏显示
    NLWMobileAndReturnTop,            //从上向下移动并返回
    NLWMobileAndReturnLeft,           //从左向右移动并返回
    NLWMobileAndReturnBottom,         //从下向上移动并返回
    NLWMobileAndReturnRight,          //从右向左移动并返回
    NLWMobileAndTop,                  //从上向下移动
    NLWMobileAndLeft,                 //从左向右移动
    NLWMobileAndBottom,               //从下向上移动
    NLWMobileAndRight                 //从右向左移动
};
@interface CTShowView : UIView

@property (nonatomic, assign) CGFloat timeAnimation; //执行动画时间
@property (nonatomic, assign) BOOL transparencyAnimation; //是否开启内容透明度动画，默认开启(设置为no，内容视图的透明度将不跟随遮罩图透明度动画走)
@property (nonatomic, assign) BOOL isUserInteractionShadowView; //判断遮罩图是否可以点击
/*
 * @param view    开发者传入自定义的内容视图
 * @param top     内容视图到屏幕顶部的距离
 * @param left    内容视图到屏幕左边的距离
 * @param width   内容视图的宽度
 * @param height  内容视图的高度
 * @param tepy    动画类型
 */
- (void)CTloadContViewTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height addView:(UIView *)view animation:(NLWAnimationMode)tepy;//适配内容图层Frame值,必写

- (void)showCustomView:(UIView *)view;//弹出，自定义view
- (void)showView;//弹出，UIWindow
- (void)dismiss;//移除
@end
