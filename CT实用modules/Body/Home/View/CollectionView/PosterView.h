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
    MovieCollectionView *smallView; //上部分
    MovieCollectionView *largeView; //下部分
}
@property(nonatomic, strong)NSArray *dataArr;//数据源

@end
