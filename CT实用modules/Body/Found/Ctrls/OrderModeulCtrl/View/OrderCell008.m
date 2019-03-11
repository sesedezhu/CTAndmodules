//
//  OrderCell008.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "OrderCell008.h"

@implementation OrderCell008
/** 初始化方法,自定义 cell时,不清楚高度,可以在这里添加子空间 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;//点击不会有选中效果
    
    [self addSubview:self.CellView];
    
    UIView *view = self;
    _CellView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .bottomSpaceToView(view, 0);
    
}
#pragma mark - 配置cell页面样式
- (void)SetTheCellStyleAtIndexPath:(NSIndexPath *)indexPath{
    [_CellView.Btn_left setTitleColor:CTColorGrayaAndBlack forState:UIControlStateNormal];
    _CellView.Btn_left.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    [_CellView.Btn_left setBackgroundColor:CTColorWhite];
    
    [_CellView.Btn_content setTitleColor:CTColorGrayaAndBlack forState:UIControlStateNormal];
    _CellView.Btn_content.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    [_CellView.Btn_content setBackgroundColor:CTColorWhite];
    
    [_CellView.Btn_right setTitleColor:CTColorGrayaAndBlack forState:UIControlStateNormal];
    _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    [_CellView.Btn_right setBackgroundColor:CTColorWhite];
}
#pragma mark - 懒加载
- (CellView008 *)CellView{
    if (!_CellView) {
        _CellView = [[CellView008 alloc]init];
        _CellView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _CellView;
}
@end
