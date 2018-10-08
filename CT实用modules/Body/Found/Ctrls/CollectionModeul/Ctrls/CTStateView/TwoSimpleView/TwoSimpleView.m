//
//  TwoSimpleView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/13.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "TwoSimpleView.h"

@interface TwoSimpleView()
@property (nonatomic, strong) UILabel *ContentLabel;         //内容文字
@end
@implementation TwoSimpleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor = allcolorAlphasCT(228, 228, 228, 1.0);
    
    [self addSubview:self.ContentLabel];
    
    UIView *view = self;
    _ContentLabel.sd_layout
    .topSpaceToView(view, 0)
    .centerXIs(kScreenWidth/2)
    .bottomSpaceToView(view, 0)
    .widthIs(CONVER_VALUE(305));
    
    _ContentLabel.text = @"您当前暂无聊天历史记录……";
}
#pragma mark - 懒加载
- (UILabel *)ContentLabel{
    if (!_ContentLabel) {
        _ContentLabel = [[UILabel alloc]init];
        _ContentLabel.textColor = allcolorAlphasCT(68, 66, 66, 1.0);
        _ContentLabel.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
        _ContentLabel.textAlignment = NSTextAlignmentCenter;
//        _ContentLabel.numberOfLines = 0;
    }
    return _ContentLabel;
}

@end
