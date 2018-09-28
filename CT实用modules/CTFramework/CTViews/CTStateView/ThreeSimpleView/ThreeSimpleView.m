//
//  ThreeSimpleView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/22.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "ThreeSimpleView.h"

@interface ThreeSimpleView()
@property (nonatomic, strong) UIImageView *LoadImaView;  //加载图片（提示）
@property (nonatomic, strong) UILabel *LoadTitleLab;     //加载文字（提示）
@end

@implementation ThreeSimpleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor =allcolorAlphasCT(228, 228, 228, 1.0);
    [self addSubview:self.LoadImaView];
    [self addSubview:self.LoadTitleLab];
    [self addSubview:self.ContentLab];
    [self addSubview:self.btn];
    
    UIView *view = self;
    _LoadImaView.sd_layout
    .topSpaceToView(view, CONVER_VALUE(204))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(45))
    .heightIs(CONVER_VALUE(45));
    
    _LoadTitleLab.sd_layout
    .topSpaceToView(_LoadImaView, CONVER_VALUE(34))
    .leftSpaceToView(view, CONVER_VALUE(20))
    .rightSpaceToView(view, CONVER_VALUE(20))
    .heightIs(CONVER_VALUE(15));
    
    _btn.sd_layout
    .bottomSpaceToView(view, CONVER_VALUE(45))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(250))
    .heightIs(CONVER_VALUE(40));
    
    _ContentLab.sd_layout
    .bottomSpaceToView(_btn, CONVER_VALUE(20))
    .leftSpaceToView(view, CONVER_VALUE(20))
    .rightSpaceToView(view, CONVER_VALUE(20))
    .heightIs(CONVER_VALUE(12));
    
    //变圆
    _btn.layer.cornerRadius = CONVER_VALUE(5);//半径大小
    _btn.layer.masksToBounds = YES;//是否切割
    [_btn.layer setBorderWidth:1.0]; //边框宽度
    [_btn.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1.0).CGColor];//边框颜色
    
    _LoadTitleLab.text = @"稍等，当地玩家正在加速赶来……";
    _ContentLab.text = @"只有当地玩咖才能带您领略最本土风情";
    [_btn setTitle:@"取消匹配" forState:UIControlStateNormal];
    [_LoadImaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"threeSimple_Warning"]];
    
    //添加旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 0.8;     //动画时长
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 2000;//重复次数，持续不停设置HUGE_VALF
    rotationAnimation.removedOnCompletion = NO;  //可防止home再进来动画停止，不用的时候要删除，防止内存泄漏
    [_LoadImaView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
- (void)dealloc{
    [_LoadImaView.layer removeAnimationForKey:@"rotationAnimation"];
}
#pragma mark - 懒加载
- (UIImageView *)LoadImaView{
    if (!_LoadImaView) {
        _LoadImaView = [[UIImageView alloc]init];
        _LoadImaView.backgroundColor = [UIColor clearColor];
    } 
    return _LoadImaView;
}
- (UILabel *)LoadTitleLab{
    if (!_LoadTitleLab) {
        _LoadTitleLab = [[UILabel alloc]init];
        _LoadTitleLab.textColor = allcolorAlphasCT(51, 51, 51, 1.0);
        _LoadTitleLab.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
        _LoadTitleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _LoadTitleLab;
}
- (UILabel *)ContentLab{
    if (!_ContentLab) {
        _ContentLab = [[UILabel alloc]init];
        //        _ContentLabel.numberOfLines = 0;
        _ContentLab.textColor = allcolorAlphasCT(187, 187, 187, 1.0);
        _ContentLab.font = [UIFont systemFontOfSize: CONVER_VALUE(12)];
        _ContentLab.textAlignment = NSTextAlignmentCenter;
    }
    return _ContentLab;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]init];
        [_btn setTitleColor:allcolorAlphasCT(255, 255, 255, 1.0) forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
        _btn.backgroundColor = allcolorAlphasCT(73, 75, 81, 1.0);
    }
    return _btn;
}
@end
