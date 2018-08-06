//
//  CTShowsManager.m
//  HaiBa
//
//  Created by 涛程 on 2018/5/7.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CTShowsManager.h"
static CTShowView * _show = nil;
@implementation CTShowsManager
+ (void)CTloadInitContViewTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height addView:(UIView *)view animationTepy:(NLWAnimationMode)tepy transparency:(BOOL)animation interaction:(BOOL)isUserInteractionShadowView{
    _show = [[CTShowView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_show CTloadContViewTop:top Left:left Width:width Height:height addView:view animation:tepy];
    _show.transparencyAnimation = animation;
    _show.isUserInteractionShadowView = isUserInteractionShadowView;
    [_show showView];

}

+ (void)dismiss{
    [_show dismiss];
}

@end
