//
//  SmallMovieView.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "SmallMovieView.h"
#import "SmallViewCell.h"

#define kSmallViewCellID    @"kSmallViewCellID"

@implementation SmallMovieView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.itemWidth = CONVER_VALUE(55);
        
        //一、注册cell
        [self registerClass:[SmallViewCell class] forCellWithReuseIdentifier:kSmallViewCellID];
        
    }
    
    return self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SmallViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSmallViewCellID forIndexPath:indexPath];
    
    cell.dataDic = self.dataArr[indexPath.row];
    
    return cell;
}
//设置每个单元格大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%@", NSStringFromCGSize(CGSizeMake(_itemWidth, self.height)));
    return CGSizeMake(self.itemWidth, CONVER_VALUE(80));
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentIndex != indexPath.row) {
        //如果点击的不是居中的cell，那么就滚动到中间
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //给当前页码赋值，让观察者能够响应
        self.currentIndex = indexPath.row;
         NSLog(@"点击事件滚动到中");
    }else{
        NSLog(@"小图居中");
    }
    //点击cell响应
    NSLog(@"indexPath2222 ============== %ld",(long)indexPath.row);
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
//        NSLog(@"小图滑动事件到中");
//    }
//    
//}
@end
