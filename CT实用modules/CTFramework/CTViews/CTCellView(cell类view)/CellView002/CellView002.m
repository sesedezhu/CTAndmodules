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
    //    self.selectionStyle = UITableViewCellSelectionStyleNone;//点击不会有选中效果
    //设置此属性，是否显示系统右侧图标,此类此方法禁止设置,已经人为创建
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [self addSubview:self.Lab_left];
    [self addSubview:self.Ima_right];
    [self addSubview:self.View_line];
    
}
- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    
    CGFloat height = self.bounds.size.height;
    UIView *contentView = self;
    _View_line.sd_layout
    .bottomSpaceToView(contentView, 0)
    .leftSpaceToView(contentView, LeftSpaceToCTView)
    .rightSpaceToView(contentView, RightSpaceToCTView)
    .heightIs(1);
    
    _Lab_left.sd_layout
    .centerYIs(height/2)
    .leftEqualToView(_View_line)
    .widthIs(CONVER_VALUE(120))
    .heightIs(CONVER_VALUE(49));
    
    _Ima_right.sd_layout
    .centerYIs(height/2)
    .rightEqualToView(_View_line)
    .widthIs(CONVER_VALUE(70))
    .heightIs(CONVER_VALUE(70));
    
}
#pragma mark - 懒加载
- (UILabel *)Lab_left{
    if (!_Lab_left) {
        _Lab_left = [CTUIManagers createLabelText:@"头像" textColor:nil font:nil textAlignment:NSTextAlignmentLeft backgroundColor:nil];
        _Lab_left.adjustsFontSizeToFitWidth = YES;
    }
    return _Lab_left;
}
- (UIImageView *)Ima_right{
    if (!_Ima_right) {
        NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
        NSString *imaurl = nil;
        if (UserDic != nil){
            NSString *photo     = UserDic[@"photo"];
            imaurl = [NSString stringWithFormat:@"http://img.naliwan.com/%@",photo];
        }
        _Ima_right = [CTUIManagers createImageViewURL:imaurl placeholderImage:@"Cell002Right"];
    }
    return _Ima_right;
}
- (UIView *)View_line{
    if (!_View_line) {
        _View_line = [CTUIManagers createView];
        _View_line.backgroundColor = CTColorGroupTableViewBackground;
        _View_line.hidden = YES;

    }
    return _View_line;
}

@end
