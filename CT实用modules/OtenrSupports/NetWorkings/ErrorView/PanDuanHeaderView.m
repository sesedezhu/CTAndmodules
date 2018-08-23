//
//  PanDuanHeaderView.m
//  HaiBa
//
//  Created by 涛程 on 2017/6/23.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "PanDuanHeaderView.h"

@implementation PanDuanHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadDaiUI];
    }
    return self;
}

- (void)loadDaiUI{
    self.Lab_Title.backgroundColor = [UIColor clearColor];
    [self addSubview:_Lab_Title];
}
- (void)layoutSubviews{
    /* 为子控件添加fram */
    [super layoutSubviews];
//    self.backgroundColor = allcolor;
    //使用自动布局在这里面写貌似无效
    _Lab_Title.frame = CGRectMake(0, 0, kScreenWidth, 50);
}
- (UILabel *)Lab_Title{
    if (!_Lab_Title) {
        _Lab_Title = [[UILabel alloc]init];
        _Lab_Title.text = @"当前无网络！请检查网络设置是否正常";
        _Lab_Title.textColor = [UIColor redColor];
        _Lab_Title.textAlignment = NSTextAlignmentCenter;
    }
    return _Lab_Title;
}

@end
