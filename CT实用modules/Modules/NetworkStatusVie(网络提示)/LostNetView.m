//
//  LostNetView.m
//  HaiBa
//
//  Created by 谭晓强 on 2018/7/17.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LostNetView.h"

@implementation LostNetView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self loadUI];
    }
    return self;
}

-(void)loadUI{
 _contentView = [[UIView alloc] initWithFrame:(CGRect){CONVER_VALUE(0), 64, kScreenWidth, CONVER_VALUE(44)}];
    
    [self addSubview:_contentView];
    //    [_contentView addGestureRecognizer:contentViewGesture];
    self.contentView = _contentView;
    
    self.leftImage.backgroundColor = [UIColor redColor];
    
    
    
    self.titleLabel.text = @"网络请求失败,请检查您的网络设置";
    _titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    
    self.rightImage.backgroundColor = CTColorBlack;
    
    
    [_contentView addSubview:_leftImage];
    [_contentView addSubview:_titleLabel];
    [_contentView addSubview:_rightImage];
    
    _leftImage.sd_layout.topSpaceToView(_contentView, CONVER_VALUE(8))
    .leftSpaceToView(_contentView, CONVER_VALUE(6))
    .widthIs(CONVER_VALUE(28))
    .heightIs(CONVER_VALUE(28));
    
    _titleLabel.sd_layout.topSpaceToView(_contentView, CONVER_VALUE(8))
    .leftSpaceToView(_leftImage, CONVER_VALUE(8))
    .widthIs(CONVER_VALUE(250))
    .heightIs(CONVER_VALUE(28));
    
    _rightImage.sd_layout.topSpaceToView(_contentView, CONVER_VALUE(8))
    .rightSpaceToView(_contentView, CONVER_VALUE(12))
    .widthIs(CONVER_VALUE(10))
    .heightIs(CONVER_VALUE(28));
}
#pragma mark - public
/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    __weak typeof(self) _weakSelf = self;
    self.contentView.frame = CGRectMake(CONVER_VALUE(0),64, kScreenWidth,CONVER_VALUE(44));

    
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _weakSelf.contentView.frame = CGRectMake(CONVER_VALUE(0),64, kScreenWidth,CONVER_VALUE(44));
    }];
}

/**
 *  属性视图的消失
 */
- (void)removeView {
    
    __weak typeof(self) _weakSelf = self;
    
    [UIView animateWithDuration:1.0 animations:^{
        _weakSelf.backgroundColor = CTColorClear;
        _weakSelf.contentView.frame = CGRectMake(CONVER_VALUE(0),64, kScreenWidth,CONVER_VALUE(44));
        [_weakSelf removeFromSuperview];
    }];
}
-(UIImageView*)leftImage{
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc]init];
    }
    return _leftImage;
}
-(UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}
-(UIImageView*)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]init];
    }
    return _rightImage;
}
@end
