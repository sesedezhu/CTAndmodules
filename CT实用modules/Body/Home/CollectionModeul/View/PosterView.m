//
//  CollecViewModeule.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "PosterView.h"
#import "LargeMovieView.h"
#import "SmallMovieView.h"
#import "LargeLayout.h"
#import "SmallLayout.h"
@interface PosterView()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView *BackImaView;  //背景图片

@end
@implementation PosterView
- (void)dealloc
{
    [_largeView removeObserver:_smallView forKeyPath:@"currentIndex" context:nil];
    [_smallView removeObserver:_largeView forKeyPath:@"currentIndex" context:nil];
    //销毁通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AssociatedAndCellIndexPath object:nil];
    NSLog(@"销毁了！～");
}
-(instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}
-(void)createUI{
    //创建大海报视图
    [self createLargeView];
    //创建头视图（小的collection view）
    [self createHeaderView];
    //创建固定悬浮按钮
    [self createSuspensionButton];
    
    
    //注册观察者
    //大小collectionview互相观察
    [_largeView addObserver:_smallView forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    [_smallView addObserver:_largeView forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadAssociatedAndCellIndexPath) name:AssociatedAndCellIndexPath object:nil];
}
- (void)loadAssociatedAndCellIndexPath{
    [_largeView reloadData];
    if (_smallView.dataArr.count == 0) {
        NSLog(@"数组空了！！");
    }
}
-(void)createLargeView
{
    self.BackImaView.frame = CGRectMake(0, CONVER_VALUE(203), kScreenWidth, CONVER_VALUE(365));
    [_BackImaView setImage:[UIImage imageNamed:@"4.jpeg"]];
    [self addSubview:_BackImaView];
    
    MovieLayout *layout = [[LargeLayout alloc] init];
    _largeView = [[LargeMovieView alloc] initWithFrame:CGRectMake(0, CONVER_VALUE(203), kScreenWidth, CONVER_VALUE(365)) collectionViewLayout:layout];
    [self addSubview:_largeView];

}
-(void)createHeaderView{
    MovieLayout *layout = [[SmallLayout alloc] init];
    _smallView = [[SmallMovieView alloc] initWithFrame:CGRectMake(0, CONVER_VALUE(50), kScreenWidth, CONVER_VALUE(120)) collectionViewLayout:layout];
    [self addSubview:_smallView];
    _smallView.backgroundColor = [UIColor lightGrayColor];
    
}

- (void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    _largeView.dataArr = dataArr;
    _smallView.dataArr = dataArr;
}

- (void)createSuspensionButton{
    UIImageView *imaView = [[UIImageView alloc]init];
    imaView.backgroundColor = [UIColor clearColor];
    [self addSubview:imaView];
    
    UIView *view = self;
    imaView.sd_layout
    .bottomSpaceToView(view, CTStopTabBarRect+CTStopNavRect+CTStopStatusRect+CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(4))
    .widthIs(CONVER_VALUE(74))
    .heightIs(CONVER_VALUE(74));
    
    [imaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"WK_matchingBtn"]];
    imaView.userInteractionEnabled = YES;//打开用户交互
    //添加点击事件
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(MatchPlayCurry)];
    tapGesture.delegate =self;
    [imaView addGestureRecognizer:tapGesture];
}
- (void)MatchPlayCurry{
    NSLog(@"开始匹配玩咖！！！");
}





- (UIImageView *)BackImaView{
    if (!_BackImaView) {
        _BackImaView = [[UIImageView alloc]init];
    }
    return _BackImaView;
}
@end
