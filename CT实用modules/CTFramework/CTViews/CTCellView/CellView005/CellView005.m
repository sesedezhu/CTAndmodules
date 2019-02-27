//
//  CellView005.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/27.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView005.h"

@implementation CellView005
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.Ima_left];
    [self addSubview:self.Ima_right];
    [self addSubview:self.View_line];
    
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .rightSpaceToView(contentView, -CONVER_VALUE(15))
    .heightIs(1);
    
    _Ima_left.sd_layout
    .bottomSpaceToView(_View_line, CONVER_VALUE(15))
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .widthIs(CONVER_VALUE(29))
    .heightIs(CONVER_VALUE(29));
    
    _Ima_right.sd_layout
    .bottomSpaceToView(_View_line, CONVER_VALUE(21))
    .rightSpaceToView(contentView, CONVER_VALUE(15))
    .widthIs(CONVER_VALUE(18))
    .heightIs(CONVER_VALUE(18));
    
}

#pragma mark - 懒加载
- (UIImageView *)Ima_left{
    if (!_Ima_left) {
        _Ima_left = [CTUIManagers createImageViewURL:nil placeholderImage:@"Cell005Left"];
    }
    return _Ima_left;
}
- (UIImageView *)Ima_right{
    if (!_Ima_right) {
        _Ima_right = [CTUIManagers createImageViewURL:nil placeholderImage:@"Cell005Right"];
    }
    return _Ima_right;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.hidden = YES;
    }
    return _View_line;
}

@end
