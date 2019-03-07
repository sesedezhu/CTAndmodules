//
//  CellView004.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/26.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView004.h"

@implementation CellView004
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    //设置此属性，点击cell不会有灰色显示
    //    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置此属性，是否显示系统右侧图标
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [self addSubview:self.Btn];
    UIView *contentView = self;
    _Btn.sd_layout
    .topSpaceToView(contentView, CONVER_VALUE(1))
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .rightSpaceToView(contentView, CONVER_VALUE(15))
    .bottomSpaceToView(contentView, CONVER_VALUE(1));
}

- (void)updateUIFrameTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height{
    [_Btn sd_clearAutoLayoutSettings];//清空自动布局
    UIView *contentView = self;
    _Btn.sd_layout
    .topSpaceToView(contentView, top)
    .leftSpaceToView(contentView, left)
    .widthIs(width)
    .heightIs(height);
    
}
#pragma mark - 懒加载
- (UIButton *)Btn{
    if (!_Btn) {
        _Btn = [CTUIManagers createButtonNormalText:@"退出登录" normalTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:[UIColor clearColor]];
        _Btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [CTUIManagers CTBtnRadius:_Btn Radius:3];
        [CTUIManagers CTBtnBorder:_Btn refColor:[UIColor groupTableViewBackgroundColor].CGColor];
    }
    return _Btn;
}
@end
