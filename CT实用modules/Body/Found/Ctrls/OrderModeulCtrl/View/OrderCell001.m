//
//  OrderCell001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "OrderCell001.h"

@implementation OrderCell001
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
    
    [_CellView loadCellHiddenStyle:YES];
}
#pragma mark - 配置cell页面样式
- (void)SetTheCellStyleAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            _CellView.View_line.hidden = NO;
        }
            break;
            
        default:{
            _CellView.View_line.hidden = YES;
        }
            break;
    }
    [self setLabTextFont:indexPath];
    [self setLabTextContents:indexPath];
}
//设置字体大小、默认控件颜色及是否隐藏相关控件
- (void)setLabTextFont:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
            _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
            _CellView.Lab_left.textColor = CTColorGrayaAndBlack;
            [_CellView.Btn_right setTitleColor:CTColorOrange forState:UIControlStateNormal];
            _CellView.Btn_right.hidden = NO;
        }
            break;
        case 2:{
            if (indexPath.row == 0) {
                _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
                _CellView.Lab_left.textColor = CTColorGrayaAndBlack;
                _CellView.Btn_right.hidden = YES;
            }else if (indexPath.row == 5) {
                _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
                _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
                _CellView.Lab_left.textColor = CTColorLightGraya;
                [_CellView.Btn_right setTitleColor:CTColorOrange forState:UIControlStateNormal];
                _CellView.Btn_right.hidden = NO;
            }else{
                _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
                _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
                _CellView.Lab_left.textColor = CTColorLightGraya;
                [_CellView.Btn_right setTitleColor:CTColorLightGraya forState:UIControlStateNormal];
                _CellView.Btn_right.hidden = NO;
            }
        }
            break;
            
        default:{
            _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
            _CellView.Btn_right.hidden = YES;
        }
            break;
    }
}
//设置系统文案
- (void)setLabTextContents:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
             _CellView.Lab_left.text = @"支付状态";
            [_CellView.Btn_right setTitle:@"xxx" forState:UIControlStateNormal];
            break;
        case 2:{
            switch (indexPath.row) {
                case 0:
                    _CellView.Lab_left.text = @"交易明细";
                    break;
                case 1:
                    _CellView.Lab_left.text = @"房费总额";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    break;
                case 2:
                    _CellView.Lab_left.text = @"押金费用";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    break;
                case 3:
                    _CellView.Lab_left.text = @"优惠金额";
                    [_CellView.Btn_right setTitle:@"无折扣" forState:UIControlStateNormal];
                    break;
                case 4:
                    _CellView.Lab_left.text = @"折扣";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    _CellView.View_line.hidden = NO;
                    break;
                default:
                    _CellView.Lab_left.text = @"需付款";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    break;
            }
        }
            break;
        default:
            _CellView.Lab_left.text = @"入住人信息";
            break;
    }
}
#pragma mark - 懒加载
- (CellView001 *)CellView{
    if (!_CellView) {
        _CellView = [[CellView001 alloc]init];
    }
    return _CellView;
}

@end
