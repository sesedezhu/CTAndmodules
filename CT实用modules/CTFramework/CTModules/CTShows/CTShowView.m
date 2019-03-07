//
//  CTShowView.m
//  订单模版
//
//  Created by 涛程 on 2018/4/25.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CTShowView.h"
@interface CTShowView()
{
    CGFloat _top;
    CGFloat _left;
    CGFloat _width;
    CGFloat _height;
}
@property (nonatomic, strong) UIView *shadowView;                                       /* 遮罩层**/
@property (nonatomic, strong) UIView *contentView;                                       /* 内容图层**/
@property (nonatomic, assign) int start;   //开始动画配置
@property (nonatomic, assign) int end;   //结束动画配置
@end
@implementation CTShowView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    //本view为不显示状态
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.01f];
    
    //创建遮视图
    [self insertSubview:self.shadowView belowSubview:self];
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapGest)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    [_shadowView addGestureRecognizer:tap];
    
}
- (void)respondsToTapGest {
    [self dismiss];
}
- (void)CTloadContViewTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height addView:(UIView *)view animation:(NLWAnimationMode)tepy{
    _top = top;
    _left = left;
    _width = width;
    _height = height;
    //0.配置动画属性
    [self NLWAnimationConfiguration:tepy];
    //1.创建内容图
    [self addSubview:self.contentView];
    //2.设置进入动画样式
    [self startAnimation];
    //3.添加用户自定义View
    [_contentView addSubview:view];
    view.frame = CGRectMake(0, 0, _width, _height);
    
}
- (void)setTimeAnimation:(CGFloat)timeAnimation{
    _timeAnimation = timeAnimation;
}
- (void)setTransparencyAnimation:(BOOL)transparencyAnimation{
    _transparencyAnimation = transparencyAnimation;
    if (!_transparencyAnimation) {
        self.contentView.alpha = 1.0;
    }
}
- (void)setIsUserInteractionShadowView:(BOOL)isUserInteractionShadowView{
    _isUserInteractionShadowView = isUserInteractionShadowView;
    _shadowView.userInteractionEnabled = _isUserInteractionShadowView;
}
#pragma mark - 开始动画
- (void)showView{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:_timeAnimation animations:^{
        [weakSelf showAnimations];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)showAnimations{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    self.shadowView.alpha = 0.5;
    self.contentView.alpha = 1.0;
    //样式配置
    self.contentView.frame = CGRectMake(_left, _top, _width, _height);
}
#pragma mark - 移除动画
- (void)dismiss{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:_timeAnimation animations:^{
        [weakSelf dismissAnimations];
    } completion:^(BOOL finished) {
        if (self.superview || self) {
            [self removeFromSuperview];
        }
    }];
}
- (void)dismissAnimations{
    //设置结束动画
    [self endAnimation];
    self.shadowView.alpha = 0.0;
    if (!self.transparencyAnimation) {
        self.contentView.alpha = 1.0;
    }else{
        self.contentView.alpha = 0.0;
    }
}
#pragma mark - 动画类型配置
- (void)NLWAnimationConfiguration:(NLWAnimationMode)tepy{
    switch (tepy) {
        case NLWDefault:
            _start = 0;
            _end = 0;
            break;
        case NLWMobileAndReturnTop:
            _start = 3;
            _end = 3;
            break;
        case NLWMobileAndReturnLeft:
            _start = 1;
            _end = 1;
            break;
        case NLWMobileAndReturnBottom:
            _start = 4;
            _end = 4;
            break;
        case NLWMobileAndReturnRight:
            _start = 2;
            _end = 2;
            break;
        case NLWMobileAndTop:
            _start = 3;
            _end = 4;
            break;
        case NLWMobileAndLeft:
            _start = 1;
            _end = 2;
            break;
        case NLWMobileAndBottom:
            _start = 4;
            _end = 3;
            break;
        case NLWMobileAndRight:
            _start = 2;
            _end = 1;
            break;
            
        default:
            break;
    }
}
- (void)startAnimation{
    switch (_start) {
        case 0://默认中间显示
            _contentView.frame = CGRectMake(_left, _top, _width, _height);
            break;
        case 1://左边进入
            _contentView.frame = CGRectMake(-_width, _top, _width, _height);
            break;
        case 2://右边进入
            _contentView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, _top, _width, _height);
            break;
        case 3://上边进入
            _contentView.frame = CGRectMake(_left, -_height, _width, _height);
            break;
        case 4://下边进入
            _contentView.frame = CGRectMake(_left, [UIScreen mainScreen].bounds.size.height, _width, _height);
            break;
        default://默认中间显示
            _contentView.frame = CGRectMake(_left, _top, _width, _height);
            break;
    }
}
- (void)endAnimation{
    switch (_end) {
        case 0://默认中间隐藏
            _contentView.frame = CGRectMake(_left, _top, _width, _height);
            break;
        case 1://左边离开
            _contentView.frame = CGRectMake(-_width, _top, _width, _height);
            break;
        case 2://右边离开
            _contentView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, _top, _width, _height);
            break;
        case 3://上边离开
            _contentView.frame = CGRectMake(_left, -_height, _width, _height);
            break;
        case 4://下边离开
            _contentView.frame = CGRectMake(_left, [UIScreen mainScreen].bounds.size.height, _width, _height);
            break;
        default://默认中间隐藏
            _contentView.frame = CGRectMake(_left, _top, _width, _height);
            break;
    }
}
#pragma mark - dealloc
-(void)dealloc{
    if (self.superview || self) {
        [self removeFromSuperview];
    }
}
#pragma mark - 懒加载
- (UIView *)shadowView{
    if (!_shadowView) {
        _shadowView = [[UIView alloc]initWithFrame:self.bounds];
        _shadowView.backgroundColor = [UIColor blueColor];
        _shadowView.alpha = 0.0;
    }
    return _shadowView;
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = CTColorClear;
        _contentView.alpha = 0.0;
    }
    return _contentView;
}

@end
