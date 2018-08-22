//
//  FourSimpleView.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/22.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "FourSimpleView.h"

@interface FourSimpleView()
@property (nonatomic, strong) UIImageView *LoadImaView;  //加载图片（提示）
@property (nonatomic, strong) UILabel *LoadTitleLab;     //加载文字（提示）
@property (nonatomic, strong) UILabel *ContentLab;     //加载文字（提示）
@property (nonatomic, strong) UIButton *btn;         //按钮
@property (nonatomic, strong) UIButton *ReturnBtn;         //按钮
//定时器
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end

@implementation FourSimpleView

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
    [self addSubview:self.ReturnBtn];
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
    .heightIs(CONVER_VALUE(40));
    
    _ContentLab.sd_layout
    .bottomSpaceToView(view, CONVER_VALUE(48))
    .leftSpaceToView(view, CONVER_VALUE(20))
    .rightSpaceToView(view, CONVER_VALUE(20))
    .heightIs(CONVER_VALUE(13));
    
    _ReturnBtn.sd_layout
    .bottomSpaceToView(_ContentLab, CONVER_VALUE(22))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(250))
    .heightIs(CONVER_VALUE(40));
    
    _btn.sd_layout
    .bottomSpaceToView(_ReturnBtn, CONVER_VALUE(19))
    .centerXIs(kScreenWidth/2)
    .widthIs(CONVER_VALUE(250))
    .heightIs(CONVER_VALUE(40));
    
    //变圆
    _btn.layer.cornerRadius = CONVER_VALUE(5);//半径大小
    _btn.layer.masksToBounds = YES;//是否切割
    [_btn.layer setBorderWidth:1.0]; //边框宽度
    [_btn.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1.0).CGColor];//边框颜色
    
    //变圆
    _ReturnBtn.layer.cornerRadius = CONVER_VALUE(5);//半径大小
    _ReturnBtn.layer.masksToBounds = YES;//是否切割
    [_ReturnBtn.layer setBorderWidth:1.0]; //边框宽度
    [_ReturnBtn.layer setBorderColor:allcolorAlphasCT(143, 152, 174, 1.0).CGColor];//边框颜色
    
    _LoadTitleLab.text = @"很遗憾，匹配不到您要求的玩咖！\n建议您选择其他城市匹配试试。";
    _ContentLab.text = @"10秒未操作，将自动返回……";
    [_btn setTitle:@"重新匹配" forState:UIControlStateNormal];
    [_ReturnBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_LoadImaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"1.jpeg"]];
    
    [_btn addTarget:self action:@selector(gainMatchingObjectWK) forControlEvents:UIControlEventTouchDown];
    [_ReturnBtn addTarget:self action:@selector(returnPosterViews) forControlEvents:UIControlEventTouchDown];
}
- (void)loadStartTimer:(int)timer clickButtonBlocks:(ClickButtonBlock)block{
    [self startTimer:timer];
    self.clickButtonBlocks = block;
}
#pragma mark - 点击事件
//再次匹配按钮点击事件
- (void)gainMatchingObjectWK{
    if (_clickButtonBlocks) {
        _clickButtonBlocks(3);//3为重新匹配
    }
    [self EndTimer];
}
//返回有数据聊天界面
- (void)returnPosterViews{
    if (_clickButtonBlocks) {
        _clickButtonBlocks(1);//返回聊天列表页
    }
    [self EndTimer];
}
#pragma mark - 倒计时
// 定时器倒计时
//开始
- (void)startTimer:(int)timer
{
    _count = timer;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}
//结束
- (void)EndTimer{
    [self.countTimer invalidate];
    self.countTimer = nil;
}
//运行时
- (void)countDown
{
    
    _count --;
    _ContentLab.text = [NSString stringWithFormat:@"%d秒未操作，将自动返回……",_count];

    if (_count <= 0) {
        NSLog(@"时间到");
        [self EndTimer];
        [self returnPosterViews];
    }
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
        _LoadTitleLab.textColor = allcolorAlphasCT(96, 96, 96, 1.0);
        _LoadTitleLab.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
        _LoadTitleLab.textAlignment = NSTextAlignmentCenter;
        _LoadTitleLab.numberOfLines = 0;
    }
    return _LoadTitleLab;
}
- (UILabel *)ContentLab{
    if (!_ContentLab) {
        _ContentLab = [[UILabel alloc]init];
        //        _ContentLabel.numberOfLines = 0;
        _ContentLab.textColor = allcolorAlphasCT(173, 173, 173, 1.0);
        _ContentLab.font = [UIFont systemFontOfSize: CONVER_VALUE(12)];
        _ContentLab.textAlignment = NSTextAlignmentCenter;
    }
    return _ContentLab;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]init];
        [_btn setTitleColor:allcolorAlphasCT(87, 95, 115, 1.0) forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
        _btn.backgroundColor = [UIColor clearColor];
    }
    return _btn;
}
- (UIButton *)ReturnBtn{
    if (!_ReturnBtn) {
        _ReturnBtn = [[UIButton alloc]init];
        [_ReturnBtn setTitleColor:allcolorAlphasCT(87, 95, 115, 1.0) forState:UIControlStateNormal];
        _ReturnBtn.titleLabel.font = [UIFont systemFontOfSize: CONVER_VALUE(15)];
        _ReturnBtn.backgroundColor = [UIColor clearColor];
    }
    return _ReturnBtn;
}

- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}


@end
