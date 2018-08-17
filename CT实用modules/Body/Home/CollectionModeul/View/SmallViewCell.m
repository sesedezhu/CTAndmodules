//
//  SmallViewCell.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "SmallViewCell.h"
#import "YTAnimation.h"
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
    self.contentView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.UserImaView];
    [self.contentView addSubview:self.NicknameLab];
    [self.contentView addSubview:self.deleteBtn];
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
    
    _deleteBtn.sd_layout
    .topSpaceToView(view, 1)
    .leftSpaceToView(view, 0)
    .widthIs(CONVER_VALUE(18))
    .heightIs(CONVER_VALUE(18));
    
//    _UserImaView.backgroundColor = [UIColor lightGrayColor];
//    _NickNameLab.backgroundColor = [UIColor lightGrayColor];
//    _deleteBtn.backgroundColor = [UIColor blackColor];
    //变圆
    _UserImaView.layer.cornerRadius = CONVER_VALUE(25.5);//半径大小
    _UserImaView.layer.masksToBounds = YES;//是否切割
    
    [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"WK_deleteBtn"] forState:UIControlStateNormal];
    [_deleteBtn addTarget:self action:@selector(deleteCell) forControlEvents:UIControlEventTouchUpInside];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longClick:)];
    lpgr.minimumPressDuration = 1;//长按等待时间
    [self addGestureRecognizer:lpgr];
}
#pragma mark - 删除动画功能
- (void)longClick:(UILongPressGestureRecognizer *)lpgr
{
    if (lpgr.state==UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势开启,启动删除模式，抖动动画！");
        if (_longClickBlocks) {
            _longClickBlocks();
        }
    } else {
        NSLog(@"长按手势结束");
    }
    
}
- (void)deleteCell{
    NSLog(@"啊！我被删除了,结束抖动！");
    [YTAnimation toMiniAnimation:self];//变小动画
    if (_deleteBtnBlocks) {
        _deleteBtnBlocks(_indexPath);
    }
}
#pragma mark - 数据赋值
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
- (UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc]init];
    }
    return _deleteBtn;
}







@end
