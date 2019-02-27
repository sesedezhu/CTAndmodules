//
//  CellView002.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/26.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CellView002.h"

@implementation CellView002
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    //设置此属性，点击cell不会有灰色显示
    //    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置此属性，是否显示系统右侧图标,此类此方法禁止设置,已经人为创建
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [self addSubview:self.Lab_left];
    [self addSubview:self.Ima_right];
    [self addSubview:self.View_line];
    
    UIView *contentView = self;
    _Lab_left.sd_layout
    .topSpaceToView(contentView, CONVER_VALUE(22))
    .leftSpaceToView(contentView, CONVER_VALUE(15))
    .widthIs(CONVER_VALUE(120))
    .heightIs(CONVER_VALUE(49));
    
    _Ima_right.sd_layout
    .bottomSpaceToView(contentView, CONVER_VALUE(10))
    .rightSpaceToView(contentView, CONVER_VALUE(15))
    .widthIs(CONVER_VALUE(70))
    .heightIs(CONVER_VALUE(70));
    
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftEqualToView(_Lab_left)
    .rightSpaceToView(contentView, CONVER_VALUE(15))
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
