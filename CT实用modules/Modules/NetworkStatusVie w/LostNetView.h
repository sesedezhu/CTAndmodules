//
//  LostNetView.h
//  HaiBa
//
//  Created by 谭晓强 on 2018/7/17.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LostNetView : UIView
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic ,strong) UIImageView *leftImage;
@property(nonatomic ,strong) UILabel *titleLabel;
@property(nonatomic ,strong) UIImageView *rightImage;

/**
 
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view;

/**
 *  属性视图的消失
 */
- (void)removeView;
@end
