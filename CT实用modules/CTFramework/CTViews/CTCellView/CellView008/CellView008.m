//
//  CellView008.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/7.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView008.h"

@implementation CellView008
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    
    [self addSubview:self.View_line];
    [self addSubview:self.Btn_left];
    [self addSubview:self.Btn_content];
    [self addSubview:self.Btn_right];

    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, LeftSpaceToCTView)
    .rightSpaceToView(contentView, RightSpaceToCTView)
    .heightIs(1);
    
    _Btn_left.sd_layout
    .heightIs(CONVER_VALUE(50));
    
    _Btn_content.sd_layout
    .heightIs(CONVER_VALUE(50));
    
    _Btn_right.sd_layout
    .heightIs(CONVER_VALUE(50));
    
    NSArray *arr = [NSArray arrayWithObjects:_Btn_left,_Btn_content,_Btn_right, nil];
    [self setupAutoWidthFlowItems:arr withPerRowItemsCount:arr.count verticalMargin:CONVER_VALUE(1) horizontalMargin:CONVER_VALUE(10) verticalEdgeInset:CONVER_VALUE(9) horizontalEdgeInset:LeftSpaceToCTView];
    
}
//更新布局,(写死)只适合一行且2到3个按钮设置
- (void)updateUIAutoWidthFlowItems:(NSArray *)viewsArray{
    [self clearAutoWidthFlowItemsSettings];//清楚
    //重新布置
    [self setupAutoWidthFlowItems:viewsArray withPerRowItemsCount:viewsArray.count verticalMargin:CONVER_VALUE(1) horizontalMargin:CONVER_VALUE(10) verticalEdgeInset:CONVER_VALUE(10) horizontalEdgeInset:LeftSpaceToCTView];
}
#pragma mark - 懒加载
- (UIButton *)Btn_left{
    if (!_Btn_left) {
        _Btn_left = [CTUIManagers createButtonNormalText:@"左边" normalTextColor:CTColorBlack font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:CTColorWhite];
        _Btn_left.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn_left.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _Btn_left.titleLabel.textAlignment = NSTextAlignmentCenter;
        [CTUIManagers CTBtnBorder:_Btn_left refColor:CTColorGroupTableViewBackground.CGColor];
    }
    return _Btn_left;
}
- (UIButton *)Btn_content{
    if (!_Btn_content) {
        _Btn_content = [CTUIManagers createButtonNormalText:@"中间" normalTextColor:CTColorBlack font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:CTColorWhite];
        _Btn_content.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn_content.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _Btn_content.titleLabel.textAlignment = NSTextAlignmentCenter;
        [CTUIManagers CTBtnBorder:_Btn_content refColor:CTColorGroupTableViewBackground.CGColor];
    }
    return _Btn_content;
}
- (UIButton *)Btn_right{
    if (!_Btn_right) {
        _Btn_right = [CTUIManagers createButtonNormalText:@"右边" normalTextColor:CTColorBlack font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:CTColorWhite];
        _Btn_right.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn_right.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _Btn_right.titleLabel.textAlignment = NSTextAlignmentCenter;
        [CTUIManagers CTBtnBorder:_Btn_right refColor:CTColorGroupTableViewBackground.CGColor];
    }
    return _Btn_right;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.backgroundColor = CTColorGroupTableViewBackground;
    }
    return _View_line;
}
@end
