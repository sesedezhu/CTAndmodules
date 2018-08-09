//
//  LargeMovieView.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "LargeMovieView.h"
#import "LargeViewCell.h"

#define kLargeMovieViewCellID   @"kLargeViewCellID"

@implementation LargeMovieView



-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.itemWidth = CONVER_VALUE(276);
        //一、注册cell
        [self registerClass:[LargeViewCell class] forCellWithReuseIdentifier:kLargeMovieViewCellID];
        
       
    }
    
    return self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //二、重用cell
    LargeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLargeMovieViewCellID forIndexPath:indexPath];
    
//    cell.model = self.dataArr[indexPath.row];
    
    return cell;
}

//设置每个单元格大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%@", NSStringFromCGSize(CGSizeMake(_itemWidth, self.height)));
    return CGSizeMake(self.itemWidth, CONVER_VALUE(203));
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentIndex != indexPath.row) {
        //如果点击的不是居中的cell，那么就滚动到中间
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //给当前页码赋值，让观察者能够响应
        self.currentIndex = indexPath.row;
    }else{
        NSLog(@"大图居中");
    }
    //点击cell响应
    NSLog(@"indexPath1111 ============== %ld",(long)indexPath.row);
}

@end
