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
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClickSmallMovieViewCell object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClickLargeMovieViewCell object:nil];
    NSLog(@"销毁了！～");
}
- (void)loadNoticeAndClickMethods{
    //注册观察者
    //大小collectionview互相观察
    [_largeView addObserver:_smallView forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    [_smallView addObserver:_largeView forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    //注册通知，同步删除
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadAssociatedAndCellIndexPath) name:AssociatedAndCellIndexPath object:nil];
    //注册通知，小图标点击事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ClickSmallMovieViewNotification:) name:ClickSmallMovieViewCell object:nil];
    //注册通知，小图标点击事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ClickLargeMovieViewNotification:) name:ClickLargeMovieViewCell object:nil];
    //本页空白点击事件
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(NoticeHandleDoubleTap:)];
    [doubletap setNumberOfTapsRequired:2];
    doubletap.delegate = self;
    [self addGestureRecognizer:doubletap];
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
        [self loadNoticeAndClickMethods];
    }
    
    return self;
}
#pragma mark- 创建UI
-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    //创建大海报视图
    [self createLargeView];
    //创建头视图（小的collection view）
    [self createHeaderView];
    //创建固定悬浮按钮
    [self createSuspensionButton];
    
}
-(void)createLargeView
{
    //背景图
    [self.BackImaView setImage:[UIImage imageNamed:@"4.jpeg"]];
    [self addSubview:_BackImaView];
    
    
    MovieLayout *layout = [[LargeLayout alloc] init];
    _largeView = [[LargeMovieView alloc] init];
    _largeView.collectionViewLayout = layout;
    [self addSubview:_largeView];
    
    UIView *view = self;
    _BackImaView.sd_layout
    .bottomSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .heightIs(CONVER_VALUE(365));
    
    _largeView.sd_layout
    .bottomSpaceToView(view, CONVER_VALUE(29))
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .heightIs(CONVER_VALUE(203));
}
-(void)createHeaderView{
    MovieLayout *layout = [[SmallLayout alloc] init];
    _smallView = [[SmallMovieView alloc] initWithFrame:CGRectMake(0, CONVER_VALUE(50), kScreenWidth, CONVER_VALUE(120)) collectionViewLayout:layout];
    [self addSubview:_smallView];
}

- (void)createSuspensionButton{
    UIImageView *imaView = [[UIImageView alloc]init];
    imaView.backgroundColor = [UIColor clearColor];
    [self addSubview:imaView];
    
    UIView *view = self;
    imaView.sd_layout
    .bottomSpaceToView(view, CONVER_VALUE(15))
    .rightSpaceToView(view, CONVER_VALUE(4))
    .widthIs(CONVER_VALUE(74))
    .heightIs(CONVER_VALUE(74));
    
    [imaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"WK_matchingBtn"]];
    imaView.userInteractionEnabled = YES;//打开用户交互
    //添加点击事件
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(MatchPlayCurry)];
//    tapGesture.delegate =self;
    [imaView addGestureRecognizer:tapGesture];
}
#pragma mark- --点击手势代理，为了去除手势冲突--
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isDescendantOfView:_smallView]){
        return NO;
    }
    if([touch.view isDescendantOfView:_largeView]){
        return NO;
    }
    return YES;
}
#pragma mark- 数组传值
- (void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    _largeView.dataArr = dataArr;
    _smallView.dataArr = dataArr;
}
#pragma mark- 本页点击事件
- (void)NoticeHandleDoubleTap:(UITapGestureRecognizer *) gestureRecognizer{
    //发送通知，让关联的cell同步
    [[NSNotificationCenter defaultCenter] postNotificationName:ExitSmallMovieViewAnimation object:nil userInfo:nil];
}
- (void)loadAssociatedAndCellIndexPath{
    [_largeView reloadData];
    if (_smallView.dataArr.count == 0) {
        NSLog(@"数组空了！！");
    }
}
- (void)MatchPlayCurry{
    NSLog(@"开始匹配玩咖！！！");
    [self pushAndTag:1 IndexPath:nil];
}
- (void)ClickSmallMovieViewNotification:(NSNotification *)noti{
    NSIndexPath *indexPath = noti.object;
    NSLog(@"点击了 ====== %ld",(long)indexPath.row);
    [self pushAndTag:2 IndexPath:indexPath];
}
- (void)ClickLargeMovieViewNotification:(NSNotification *)noti{
    NSIndexPath *indexPath = noti.object;
    NSLog(@"点击了 ====== %ld",(long)indexPath.row);
    [self pushAndTag:3 IndexPath:indexPath];
}
- (void)pushAndTag:(int)tag IndexPath:(NSIndexPath *)indexPath{
    if (_PushPosterViewBlocks) {
        _PushPosterViewBlocks(tag,indexPath);
    };
}

#pragma mark- 懒加载
- (UIImageView *)BackImaView{
    if (!_BackImaView) {
        _BackImaView = [[UIImageView alloc]init];
    }
    return _BackImaView;
}
@end
