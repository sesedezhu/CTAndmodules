//
//  HeaderView002.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/28.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "HeaderView002.h"

@implementation HeaderView002
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - loadUI
- (void)loadUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.Lab_money];
    UIView *view = self;
    _Lab_money.sd_layout
    .centerYIs(self.frame.size.height/2)
    .leftSpaceToView(view, CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(30));
}
#pragma mark - 懒加载
- (UILabel *)Lab_money{
    if (!_Lab_money) {
        _Lab_money = [CTUIManagers createLabelText:@"¥" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:CONVER_VALUE(20)] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    }
    return _Lab_money;
}

@end
