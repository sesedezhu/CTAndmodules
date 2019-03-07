//
//  PayNRCell001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/28.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "PayNRCell001.h"

@implementation PayNRCell001
/** 初始化方法,自定义 cell时,不清楚高度,可以在这里添加子空间 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self addSubview:self.CellView];
    
    UIView *view = self;
    _CellView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .bottomSpaceToView(view, 0);
}
- (void)updatePayNRCell001UI{
    _CellView.Lab_left.textColor = CTColorBlack;
    _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
}
#pragma mark - 懒加载
- (CellView001 *)CellView{
    if (!_CellView) {
        _CellView = [[CellView001 alloc]init];
    }
    return _CellView;
}
@end
