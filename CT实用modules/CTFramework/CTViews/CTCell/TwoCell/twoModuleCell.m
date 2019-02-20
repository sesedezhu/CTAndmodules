//
//  twoModelCell.m
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "twoModuleCell.h"

@implementation twoModuleCell
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
    
    [self.contentView addSubview:self.Lab_left];
    [self.contentView addSubview:self.Ima_right];
    [self.contentView addSubview:self.View_line];
    
    UIView *contentView = self.contentView;
    _Lab_left.sd_layout
    .topSpaceToView(contentView, CONVER_VALUE(22))
    .leftSpaceToView(contentView, CONVER_VALUE(21))
    .widthIs(CONVER_VALUE(120))
    .heightIs(CONVER_VALUE(49));
    
    _Ima_right.sd_layout
    .bottomSpaceToView(contentView, CONVER_VALUE(10))
    .rightSpaceToView(contentView, CONVER_VALUE(26))
    .widthIs(CONVER_VALUE(70))
    .heightIs(CONVER_VALUE(70));
    
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftEqualToView(_Lab_left)
    .rightSpaceToView(contentView, CONVER_VALUE(27))
    .heightIs(1);
    
    _Lab_left.text = @"头像";
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSURL *imaurl = nil;
    if (UserDic != nil){
        NSString *photo     = UserDic[@"photo"];
        imaurl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.naliwan.com/%@",photo]];
    }
    [_Ima_right sd_setImageWithURL:imaurl placeholderImage:[UIImage imageNamed:@"portraitDefault"]];
    
    _View_line.backgroundColor = allcolorAlphasCT(0, 0, 0, 0.2f);
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [[UILabel alloc]init];
        _Lab_left.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_left;
}
- (UIImageView *)Ima_right{
    if (!_Ima_right) {
        _Ima_right = [[UIImageView alloc]init];
    }
    return _Ima_right;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [[UIView alloc]init];
    }
    return _View_line;
}

@end
