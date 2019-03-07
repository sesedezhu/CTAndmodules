//
//  CellView006.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/7.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView006.h"

@implementation CellView006
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.Lab_left];
    [self addSubview:self.Lab_right];
    [self addSubview:self.View_line];
    
    
}
- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    
    CGFloat height = self.bounds.size.height;
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .rightSpaceToView(contentView, -CONVER_VALUE(15))
    .heightIs(1);
    
    _Lab_left.sd_layout
    .centerYIs(height/2)
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .widthIs(kScreenWidth/2-CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(17));
    
    _Lab_right.sd_layout
    .bottomEqualToView(_Lab_left)
    .rightSpaceToView(contentView, CONVER_VALUE(15))
    .leftSpaceToView(_Lab_left, CONVER_VALUE(10))
    .heightIs(CONVER_VALUE(17));
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [CTUIManagers createLabelText:@"State" textColor:allcolorAlphasCT(241, 96, 39, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(18)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
        
    }
    return _Lab_left;
}
- (UILabel *)Lab_right{
    if (!_Lab_right) {
        _Lab_right = [CTUIManagers createLabelText:@"剩xx分xx秒可支付" textColor:allcolorAlphasCT(241, 96, 39, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentRight backgroundColor:nil];
    }
    return _Lab_right;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _View_line;
}
@end
