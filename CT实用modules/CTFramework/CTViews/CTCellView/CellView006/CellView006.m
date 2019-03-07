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
    [self addSubview:self.Lab_content];
    [self addSubview:self.View_line];
    
    
}
- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    
    CGFloat height = self.bounds.size.height;
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, LeftSpaceToCTView)
    .rightSpaceToView(contentView, RightSpaceToCTView)
    .heightIs(1);
    
    _Lab_left.sd_layout
    .centerYIs(height/2)
    .leftEqualToView(_View_line)
    .widthIs(CONVER_VALUE(60))
    .heightIs(CONVER_VALUE(17));
    
    _Lab_content.sd_layout
    .bottomEqualToView(_Lab_left)
    .rightEqualToView(_View_line)
    .leftSpaceToView(_Lab_left, 14)
    .heightIs(CONVER_VALUE(17));
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [CTUIManagers createLabelText:@"订 单 号:" textColor:allcolorAlphasCT(145, 145, 145, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
        
    }
    return _Lab_left;
}
- (UILabel *)Lab_content{
    if (!_Lab_content) {
        _Lab_content = [CTUIManagers createLabelText:@"xxxx-xx-xx xx:xx:xx" textColor:allcolorAlphasCT(145, 145, 145, 1.0) font:[UIFont systemFontOfSize:CONVER_VALUE(13)] textAlignment:NSTextAlignmentLeft backgroundColor:nil];
    }
    return _Lab_content;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.backgroundColor = CTColorGroupTableViewBackground;
    }
    return _View_line;
}
@end
