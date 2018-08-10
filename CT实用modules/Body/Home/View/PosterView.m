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
@implementation PosterView
- (void)dealloc
{
    [largeView removeObserver:smallView forKeyPath:@"currentIndex" context:nil];
    [smallView removeObserver:largeView forKeyPath:@"currentIndex" context:nil];
    
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
    
    //注册观察者
    //大小collectionview互相观察
    [largeView addObserver:smallView forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    [smallView addObserver:largeView forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)createLargeView
{
    MovieLayout *layout = [[LargeLayout alloc] init];

    UIImageView *imaview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, kScreenWidth, CONVER_VALUE(365))];
    imaview.image = [UIImage imageNamed:@"123"];
    [self addSubview:imaview];
    
    largeView = [[LargeMovieView alloc] initWithFrame:CGRectMake(0, 300, kScreenWidth, CONVER_VALUE(365)) collectionViewLayout:layout];
    [self addSubview:largeView];
}
-(void)createHeaderView{
    MovieLayout *layout = [[SmallLayout alloc] init];
    smallView = [[SmallMovieView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 150) collectionViewLayout:layout];
    [self addSubview:smallView];
}

- (void)setDataArr:(NSArray *)dataArr{
    _dataArr = dataArr;
    largeView.dataArr = dataArr;
    smallView.dataArr = dataArr;
}

@end
