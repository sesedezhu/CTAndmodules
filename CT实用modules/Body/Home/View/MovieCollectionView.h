//
//  MovieCollectionView.h
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property(nonatomic, strong)NSArray *dataArr;       //数据源

@property(nonatomic, assign)CGFloat itemWidth;      //单元格的宽度

@property(nonatomic, assign)NSInteger currentIndex; //当前第几页

@end
