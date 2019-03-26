//
//  OrderCell006.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "OrderCell006.h"

@implementation OrderCell006
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
    [self setLabTextContents:indexPath];
    switch (indexPath.section) {
        case 3:{
            _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
            _CellView.Lab_content.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
            _CellView.Lab_left.textColor = CTColorGrayaAndBlack;
            _CellView.Lab_content.textColor = CTColorGrayaAndBlack;
        }
            break;
            
        default:{
            _CellView.Lab_content.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
            _CellView.Lab_content.textColor = CTColorGrayaAndBlack;
        }
            break;
    }
}
//设置系统文案
- (void)setLabTextContents:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 3:
            switch (indexPath.row) {
                case 1:
                    _CellView.Lab_left.text = @"姓     名:";
                    break;
                case 2:
                    _CellView.Lab_left.text = @"手 机 号:";
                    break;
                default:
                    _CellView.Lab_left.text = @"身 份 证:";
                    break;
            }
            break;
        default:
            switch (indexPath.row) {
                case 0:
                    _CellView.Lab_left.text = @"订 单 号:";
                    break;
                case 1:
                    _CellView.Lab_left.text = @"支付单号:";
                    break;
                case 2:
                    _CellView.Lab_left.text = @"下单时间:";
                    break;
                default:
                    _CellView.Lab_left.text = @"支付时间:";
                    break;
            }
            break;
    }
}
#pragma mark - 懒加载
- (CellView006 *)CellView{
    if (!_CellView) {
        _CellView = [[CellView006 alloc]init];
    }
    return _CellView;
}

@end
