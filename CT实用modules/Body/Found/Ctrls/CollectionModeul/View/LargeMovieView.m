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
    
    cell.dataDic = self.dataArr[indexPath.row];
    
    return cell;
}
//重写显示cell的偏移量
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth-self.itemWidth)/2, 0, (kScreenWidth-self.itemWidth)/2);
}
//设置每个单元格大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%@", NSStringFromCGSize(CGSizeMake(_itemWidth, self.height)));
    return CGSizeMake(self.itemWidth, CONVER_VALUE(203));
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //如果点击的不是居中的cell，那么就滚动到中间
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if (self.currentIndex != indexPath.row) {
        
        //给当前页码赋值，让观察者能够响应
        self.currentIndex = indexPath.row;
    }else{
        NSLog(@"大图居中");
        //发送通知，让关联的cell同步
        [[NSNotificationCenter defaultCenter] postNotificationName:ClickLargeMovieViewCell object:indexPath userInfo:nil];
    }
    //点击cell响应
    NSLog(@"indexPath1111 ============== %ld",(long)indexPath.row);
}
//#define mark - kvo
////观察者接收通知
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    NSInteger index = [change[@"new"] integerValue];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
//    
//    if (self.currentIndex != index) {
//        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//        self.currentIndex = index;
//        NSLog(@"大图滑动事件到中");
//    }
//    
//}
@end
