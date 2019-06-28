//
//  CTShowsManager.h
//  HaiBa
//
//  Created by 涛程 on 2018/5/7.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTShowView.h"
@interface CTShowsManager : NSObject

/*
 * @param classView 添加在那个view上
 * @param view    开发者传入自定义的内容视图，不需要设置from值
 * @param top     内容视图到屏幕顶部的距离（传入的view）
 * @param left    内容视图到屏幕左边的距离（传入的view）
 * @param width   内容视图的宽度（传入的view）
 * @param height  内容视图的高度（传入的view）
 * @param tepy    动画类型
 * @param animation                    view是否有透明度动画，no有，yes无
 * @param isUserInteractionShadowView  判断是否可以点击,默认yes可以点击
 * @param timeAnimation                设置执行动画的时间
 */
+ (void)CTCustomloadInitContViewTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height addView:(UIView *)view animationTepy:(NLWAnimationMode)tepy transparency:(BOOL)animation interaction:(BOOL)isUserInteractionShadowView time:(CGFloat)timeAnimation AndClassView:(UIView *)classView;

/*
 * @param view    开发者传入自定义的内容视图，不需要设置from值
 * @param top     内容视图到屏幕顶部的距离（传入的view）
 * @param left    内容视图到屏幕左边的距离（传入的view）
 * @param width   内容视图的宽度（传入的view）
 * @param height  内容视图的高度（传入的view）
 * @param tepy    动画类型
 * @param animation                    view是否有透明度动画，no有，yes无
 * @param isUserInteractionShadowView  判断是否可以点击,默认yes可以点击
 * @param timeAnimation                设置执行动画的时间
 */
+ (void)CTloadInitContViewTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height addView:(UIView *)view animationTepy:(NLWAnimationMode)tepy transparency:(BOOL)animation interaction:(BOOL)isUserInteractionShadowView time:(CGFloat)timeAnimation;

+ (void)dismiss;//移除

@end
