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
    .leftSpaceToView(view, CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(15))
    .heightIs(CONVER_VALUE(50));
    
    _NickNameLab.sd_layout
    .topSpaceToView(_UserImaView, CONVER_VALUE(8))
    .leftEqualToView(_UserImaView)
    .rightEqualToView(_UserImaView)
    .heightIs(CONVER_VALUE(12));
    
    _UserImaView.backgroundColor = [UIColor lightGrayColor];
    _NickNameLab.backgroundColor = [UIColor lightGrayColor];
    
    //变圆
    _UserImaView.layer.cornerRadius = CONVER_VALUE(25);//半径大小
    _UserImaView.layer.masksToBounds = YES;//是否切割
    
    _NickNameLab.adjustsFontSizeToFitWidth = YES;
}

- (void)setDataDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    
    _NickNameLab.text = dataDic[@"name"];
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
- (UILabel *)NickNameLab{
    if (!_NickNameLab) {
        _NickNameLab = [[UILabel alloc]init];
    }
    return _NickNameLab;
}
@end
