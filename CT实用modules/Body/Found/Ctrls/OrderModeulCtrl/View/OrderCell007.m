//
//  OrderCell007.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "OrderCell007.h"

@implementation OrderCell007
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
    [_CellView.Ima_left sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"OrderCell007_left"]];
    
    _CellView.Lab_title.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    _CellView.Lab_date.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
    _CellView.Lab_content.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
    _CellView.Lab_numberText.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    _CellView.Lab_number.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
    
    _CellView.Lab_title.textColor = CTColorGrayaAndBlack;
    _CellView.Lab_date.textColor = CTColorGrayaAndBlack;
    _CellView.Lab_content.textColor = CTColorOrange;
    _CellView.Lab_numberText.textColor = CTColorGrayaAndBlack;
    _CellView.Lab_number.textColor = CTColorOrange;
    
}
#pragma mark - 懒加载
- (CellView007 *)CellView{
    if (!_CellView) {
        _CellView = [[CellView007 alloc]init];
    }
    return _CellView;
}
@end
