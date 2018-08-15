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
@property (nonatomic, strong) UILabel *NicknameLab;      //昵称
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
//    self.contentView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.UserImaView];
    [self.contentView addSubview:self.NicknameLab];
    UIView *view = self.contentView;
    
    _UserImaView.sd_layout
    .topSpaceToView(view, CONVER_VALUE(5))
    .leftSpaceToView(view, CONVER_VALUE(1))
    .widthIs(CONVER_VALUE(51))
    .heightIs(CONVER_VALUE(51));
    
    _NicknameLab.sd_layout
    .bottomSpaceToView(view, CONVER_VALUE(8))
    .leftEqualToView(_UserImaView)
    .rightEqualToView(_UserImaView)
    .heightIs(CONVER_VALUE(11));
    
//    _UserImaView.backgroundColor = [UIColor lightGrayColor];
//    _NickNameLab.backgroundColor = [UIColor lightGrayColor];
    
    //变圆
    _UserImaView.layer.cornerRadius = CONVER_VALUE(25.5);//半径大小
    _UserImaView.layer.masksToBounds = YES;//是否切割
    
    
}

- (void)setDataDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    
    _NicknameLab.text = dataDic[@"name"];
//    _UserImaView.image = [UIImage imageNamed:dataDic[@"image"]];
    [_UserImaView setImage:[UIImage imageNamed:dataDic[@"image"]]];
    
}
#pragma mark - 懒加载
- (UIImageView *)UserImaView{
    if (!_UserImaView) {
        _UserImaView = [[UIImageView alloc]init];
    }
    return _UserImaView;
}
- (UILabel *)NicknameLab{
    if (!_NicknameLab) {
        _NicknameLab = [[UILabel alloc]init];
        _NicknameLab.font = [UIFont systemFontOfSize:CONVER_VALUE(11)];
        _NicknameLab.textColor = allcolorAlphasCT(0, 0, 0, 1.0);
        _NicknameLab.textAlignment = NSTextAlignmentCenter;
    }
    return _NicknameLab;
}
@end
