//
//  MyHeaderView001.h
//  CT实用modules
//
//  Created by 涛程 on 2019/2/20.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyHeaderView001 : UIView
@property(nonatomic ,strong) UIButton *LoginBtn;      //登录按钮/用户名称
@property(nonatomic ,strong) UIImageView *BakImage;   //背景图片
@property(nonatomic ,strong) UIImageView *UserImage;   //用户头像

- (void)updateDataUI; //更新界面数据
@end
//高228?
NS_ASSUME_NONNULL_END
