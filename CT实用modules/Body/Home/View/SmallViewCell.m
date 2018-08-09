//
//  SmallViewCell.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "SmallViewCell.h"
@interface SmallViewCell()
@property (nonatomic, strong) UIImageView *UserImaView;  //头像
@property (nonatomic, strong) UILabel *NickNameLab;      //昵称
@end
@implementation SmallViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI{
    self.contentView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.UserImaView];
    [self.contentView addSubview:self.NickNameLab];
    UIView *view = self.contentView;
    
    _UserImaView.sd_layout
    .topSpaceToView(view, CONVER_VALUE(15))
    .leftSpaceToView(view, CONVER_VALUE(12))
    .widthIs(CONVER_VALUE(50))
    .heightIs(CONVER_VALUE(50));
    
    _NickNameLab.sd_layout
    .topSpaceToView(_UserImaView, CONVER_VALUE(8))
    .leftEqualToView(_UserImaView)
    .rightEqualToView(_UserImaView)
    .heightIs(CONVER_VALUE(12));
    
    _UserImaView.backgroundColor = [UIColor lightGrayColor];
    _NickNameLab.backgroundColor = [UIColor lightGrayColor];
}


#pragma mark - 懒加载
- (UIImageView *)UserImaView{
    if (!_UserImaView) {
        _UserImaView = [[UIImageView alloc]init];
    }
    return _UserImaView;
}
- (UILabel *)NickNameLab{
    if (!_NickNameLab) {
        _NickNameLab = [[UILabel alloc]init];
    }
    return _NickNameLab;
}
@end
