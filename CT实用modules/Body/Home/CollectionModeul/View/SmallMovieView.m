//
//  SmallMovieView.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "SmallMovieView.h"
#import "SmallViewCell.h"
#import "YTAnimation.h"
#define kSmallViewCellID    @"kSmallViewCellID"
@interface SmallMovieView ()
@property(nonatomic, assign) BOOL deleteBtnFlag; //删除按钮是否显示
@property(nonatomic, assign) BOOL vibrateAniFlag;//抖动动画是否执行
@end
@implementation SmallMovieView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.itemWidth = CONVER_VALUE(55);
        
        //一、注册cell
        [self registerClass:[SmallViewCell class] forCellWithReuseIdentifier:kSmallViewCellID];
        [self setFlagAndGsr];
    }
    
    return self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SmallViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSmallViewCellID forIndexPath:indexPath];
    
    cell.dataDic = self.dataArr[indexPath.row];
    
    [self setCellVibrate:cell IndexPath:indexPath];
    
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
#pragma mark - 删除动画功能
- (void)setCellVibrate:(SmallViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    cell.indexPath = indexPath;
    cell.deleteBtn.hidden = _deleteBtnFlag?YES:NO;
    __weak typeof(self) weakSelf = self;
    cell.longClickBlocks = ^{
        [weakSelf showAllDeleteBtn];
    };
    cell.deleteBtnBlocks = ^(NSIndexPath *indexPath) {
        NSLog(@"删除了%ld",indexPath.row);
        [weakSelf deleteCellAtIndexpath:indexPath];
    };
    if (!_vibrateAniFlag) {
        [YTAnimation vibrateAnimation:cell];
    }else{
        [cell.layer removeAnimationForKey:@"shake"];
    }
    
}
-(void)deleteCellAtIndexpath:(NSIndexPath *)indexPath
{
    
    [self performBatchUpdates:^{
        
        //delete the cell you selected
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [self deleteItemsAtIndexPaths:@[indexPath]];
        
    } completion:^(BOOL finished) {
        [self reloadData];
    }];
}
- (void)setFlagAndGsr{//设置默认模式
    _deleteBtnFlag = YES;
    _vibrateAniFlag = YES;
    [self addDoubleTapGesture];
}
- (void)addDoubleTapGesture{//添加双击效果
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubletap setNumberOfTapsRequired:2];
    [self addGestureRecognizer:doubletap];
}
- (void) handleDoubleTap:(UITapGestureRecognizer *) gestureRecognizer{
    [self hideAllDeleteBtn];
}
- (void)hideAllDeleteBtn{//进入默认模式
    if (!_deleteBtnFlag) {
        _deleteBtnFlag = YES;
        _vibrateAniFlag = YES;
        [self reloadData];
    }
}
- (void)showAllDeleteBtn{//进入删除模式
    _deleteBtnFlag = NO;
    _vibrateAniFlag = NO;
    [self reloadData];
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
