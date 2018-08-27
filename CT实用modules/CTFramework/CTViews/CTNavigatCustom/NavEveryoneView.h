//
//  NavEveryoneView.h
//  HaiBa
//
//  Created by 涛程 on 2017/11/28.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavEveryoneView : UIView
@property(nonatomic ,strong) UILabel *title;
@property(nonatomic ,strong) UIView *titleView;
@property(nonatomic ,strong) UIButton *leftBtn;
@property(nonatomic ,strong) UIButton *rightBtn;


@property (nonatomic, assign) BOOL bottomLine; //底部线条是否存在，默认不存在

- (void)leftButtonTextAndSelected:(BOOL)selected;
@end
