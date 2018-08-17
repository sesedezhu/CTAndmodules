//
//  MovieCollectionView.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "MovieCollectionView.h"
#import "MovieLayout.h"

@implementation MovieCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewLayout alloc] init]];
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.dataSource = self;
        self.delegate = self;
        //设置减速的速率
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
        
    }
    return self;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"_dataArr ========666 %@",self.dataArr);
    return self.dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

//初始化显示cell的偏移量
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth-_itemWidth)/2, 0, (kScreenWidth-_itemWidth)/2);
}

//设置每个单元格大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@", NSStringFromCGSize(CGSizeMake(_itemWidth, self.height)));
    return CGSizeMake(_itemWidth, self.frame.size.height);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     为了两个类的点击事件，这里被子类替代了
     */
    //点击cell响应
//    if (_currentIndex != indexPath.row) {
//        //如果点击的不是居中的cell，那么就滚动到中间
//        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//
//        //给当前页码赋值，让观察者能够响应
//        self.currentIndex = indexPath.row;
//    }else{
//        //如果点击的是居中的，就打印居中
//        NSLog(@"居中");
//    }
}

//inout表示 形参能读能写
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //获取内容的偏移量
    CGFloat offsetX = targetContentOffset -> x;
//    NSLog(@"%f", offsetX);
    
    MovieLayout *layout = (MovieLayout *)self.collectionViewLayout;
    
    //item的宽度加上行间距的宽度当成页码的宽度
    NSInteger pageWidth = _itemWidth + layout.minimumLineSpacing;
    
    //根据页码的宽度计算当前是第几页（或第几个cell）
    NSInteger pageNum = (offsetX + pageWidth/2) / pageWidth;
//    NSLog(@"%ld", pageNum);
    
    //设置目标对象内容的偏移量，让它居中显示
    targetContentOffset -> x = pageNum * pageWidth;
    
    //给当前页码赋值，让观察者能够响应
    self.currentIndex = pageNum;
}

#define mark - kvo
//观察者接收通知
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSInteger index = [change[@"new"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = index;
         NSLog(@"滑动事件到中");
    }else{
        NSLog(@"111");
    }
    
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
@end
