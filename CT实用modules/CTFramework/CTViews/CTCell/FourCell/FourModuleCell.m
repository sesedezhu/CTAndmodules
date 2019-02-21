//
//  FourModuleCell.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/20.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "FourModuleCell.h"

@implementation FourModuleCell
/** 初始化方法,自定义 cell时,不清楚高度,可以在这里添加子空间 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    //设置此属性，点击cell不会有灰色显示
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置此属性，是否显示系统右侧图标
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [self.contentView addSubview:self.Btn];
    UIView *contentView = self.contentView;
    _Btn.sd_layout
    .topSpaceToView(contentView, CONVER_VALUE(1))
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .rightSpaceToView(contentView, CONVER_VALUE(15))
    .bottomSpaceToView(contentView, CONVER_VALUE(1));
}
#pragma mark - 懒加载
- (UIButton *)Btn{
    if (!_Btn) {
        _Btn = [CTUICtrlsManagers createButtonNormalText:@"退出登录" normalTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:CONVER_VALUE(15)] backgroundColor:[UIColor clearColor]];
        _Btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [CTUICtrlsManagers CTBtnRadius:_Btn Radius:3];
        [CTUICtrlsManagers CTBtnBorder:_Btn refColor:[UIColor groupTableViewBackgroundColor].CGColor];
    }
    return _Btn;
}
@end
