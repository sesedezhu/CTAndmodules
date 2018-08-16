//
//  CollecViewModeule.h
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCollectionView.h"
@interface PosterView : UIView
{
    MovieCollectionView *_smallView; //上部分
    MovieCollectionView *_largeView; //下部分
}
@property(nonatomic, strong)NSArray *dataArr;//数据源

@end

/*
 MovieCollectionView 根据UICollectionView创建；
 SmallMovieView、LargeMovieView分别继承于MovieCollectionView；
 通知设置观察者，观察两个自定义MovieCollectionView的移动距离；
 SmallMovieView 中，重写cell的宽高，
 SmallLayout 中，设置放大动画、最小间隙数。
 */
