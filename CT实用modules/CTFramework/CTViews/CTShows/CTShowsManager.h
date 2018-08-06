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
 * @param view    开发者传入自定义的内容视图
 * @param top     内容视图到屏幕顶部的距离
 * @param left    内容视图到屏幕左边的距离
 * @param width   内容视图的宽度
 * @param height  内容视图的高度
 * @param tepy    动画类型
 * @param animation  透明度动画，no有，yes无
 * @param isUserInteractionShadowView  判断是否可以点击,默认yes可以点击
 */
+ (void)CTloadInitContViewTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height addView:(UIView *)view animationTepy:(NLWAnimationMode)tepy transparency:(BOOL)animation interaction:(BOOL)isUserInteractionShadowView;

+ (void)dismiss;//移除

@end
