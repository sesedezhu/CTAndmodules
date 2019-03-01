//
//  NavEveryoneView.m
//  HaiBa
//
//  Created by 涛程 on 2017/11/28.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "NavView001.h"
@interface NavView001()
@property(nonatomic ,strong) UIView *botViewBak;

@end

@implementation NavView001

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        //设置默认背景色
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)loadUI{
    //字体大小
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    self.title.font = [UIFont systemFontOfSize:19];
    
    //背景颜色设置
    self.titleView.backgroundColor = [UIColor clearColor];
   
    //默认文字
//    [_rightBtn setTitle:@"右边" forState:UIControlStateNormal];
    [_leftBtn setTitle:@"左边" forState:UIControlStateNormal];
//    _title.text = @"标题";
    
    [_leftBtn setImage:[UIImage imageNamed:@"Nav_leftImage"] forState:UIControlStateNormal];
//    [_rightBtn setImage:[UIImage imageNamed:@"WX_UserImage"] forState:UIControlStateNormal];
    
    /**********  透明度相关？？  **********/
//    _leftBtn.titleLabel.backgroundColor = [UIColor redColor];
//    _leftBtn.titleLabel.layer.cornerRadius = CONVER_VALUE(2);
//    _leftBtn.titleLabel.layer.masksToBounds = YES;
    
//    UIImage *imaLetf = [self imageByApplyingAlpha:0.2f image:nil];
//    [_leftBtn setImage:imaLetf forState:UIControlStateHighlighted];
//    UIImage *imaRight = [self imageByApplyingAlpha:0.2f image:[UIImage imageNamed:@"WX_UserImage"]];
//    [_rightBtn setImage:imaRight forState:UIControlStateHighlighted];
    
    //默认文字颜色
    [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _title.textColor = [UIColor blackColor];
    
    //高亮时的字体颜色
    [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    //位置设置
    _leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//右边
    _leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//左边
    _title.textAlignment = NSTextAlignmentCenter;
    
    //自适应
//    _leftBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
//    _rightBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
//    _title.adjustsFontSizeToFitWidth = YES;
    _leftBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;//小数点在尾部
    _rightBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;//小数点在尾部
    _title.lineBreakMode = NSLineBreakByTruncatingTail;//小数点在尾部
    
    [self addSubview:_rightBtn];
    [self addSubview:_leftBtn];
    [self addSubview:_titleView];
    [_titleView addSubview:_title];
    [self addSubview:self.botViewBak];
    UIView *view = self;
    
    _titleView.sd_layout
    .bottomSpaceToView(view, 0)
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(155))
    .heightIs(44);
    
    _title.sd_layout
    .topSpaceToView(_titleView, 0)
    .leftSpaceToView(_titleView, 0)
    .bottomSpaceToView(_titleView, 0)
    .rightSpaceToView(_titleView, 0);
    
    _botViewBak.sd_layout
    .bottomEqualToView(view)
    .leftEqualToView(view)
    .rightEqualToView(view)
    .heightIs(1);
    
    _rightBtn.sd_layout
    .bottomSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .widthIs(CONVER_VALUE(110))
    .heightIs(44);
    
    _leftBtn.sd_layout
    .bottomSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .widthIs(CONVER_VALUE(110))
    .heightIs(44);
    
    _leftBtn.imageView.sd_layout
    .leftSpaceToView(_leftBtn, 12)
    .bottomSpaceToView(_leftBtn, 11)
    .widthIs(20)
    .heightIs(20);

    _leftBtn.titleLabel.sd_layout
    .leftSpaceToView(_leftBtn.imageView, 0)
    .rightSpaceToView(_leftBtn, 0)
    .bottomSpaceToView(_leftBtn, 11)
    .heightIs(20);
    
    _rightBtn.imageView.sd_layout
    .rightSpaceToView(_rightBtn, 12)
    .bottomSpaceToView(_rightBtn, 11)
    .widthIs(20)
    .heightIs(20);
    
    _rightBtn.titleLabel.sd_layout
    .rightSpaceToView(_rightBtn.imageView, 0)
    .leftSpaceToView(_rightBtn, 0)
    .bottomSpaceToView(_rightBtn, 11)
    .heightIs(20);
    
    
    _leftBtn.backgroundColor = [UIColor yellowColor];
    _rightBtn.backgroundColor = [UIColor yellowColor];
    _titleView.backgroundColor =[UIColor blueColor];
    _title.backgroundColor = [UIColor redColor];
    _leftBtn.imageView.backgroundColor = [UIColor lightTextColor];
    _leftBtn.titleLabel.backgroundColor = [UIColor blueColor];
}
#pragma mark - 赋值
//判断底部线条是否存在
- (void)setBottomLine:(BOOL)bottomLine{
    _bottomLine = bottomLine;
    if (_bottomLine) {
        _botViewBak.hidden = YES;
    }else{
        _botViewBak.hidden = NO;
    }
}
//判断左边按钮文字是否显示
- (void)leftButtonTextAndSelected:(BOOL)selected{
    if (selected) {
        [_leftBtn setTitle:@"左边" forState:UIControlStateNormal];
    }else{
        [_leftBtn setTitle:@"" forState:UIControlStateNormal];
    }
}
#pragma mark - 懒加载
- (UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]init];
    }
    return _rightBtn;
}
- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]init];
    }
    return _leftBtn;
}
- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
    }
    return _title;
}
- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
    }
    return _titleView;
}
- (UIView *)botViewBak{
    if (!_botViewBak) {
        _botViewBak = [[UIView alloc]init];
        _botViewBak.backgroundColor = [UIColor blackColor];
        _botViewBak.hidden = NO;
    }
    return _botViewBak;
}

/**
 *  设置图片透明度
 * @param alpha 透明度
 * @param image 图片
 */
-(UIImage *)imageByApplyingAlpha:(CGFloat )alpha  image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    
    CGContextSetAlpha(ctx, alpha);
    
    
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    
    UIGraphicsEndImageContext();
    
    
    
    return newImage;
    
}
@end
