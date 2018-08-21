//
//  SmallLayout.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "SmallLayout.h"

@implementation SmallLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        //最小行间距
        self.minimumLineSpacing = CONVER_VALUE(43);
    }
    return self;
}

static CGFloat const ActiveDistance = 55; //和cell的宽高一致
static CGFloat const ScaleFactor = 0.5; //放大倍数
//设置缩放动画
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {


    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect = (CGRect){self.collectionView.contentOffset, self.collectionView.bounds.size};
    for (UICollectionViewLayoutAttributes *attributes in array) {
        //如果cell在屏幕上则进行缩放
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            attributes.alpha = 0.5;
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;//距离中点的距离
            CGFloat normalizedDistance = distance / CONVER_VALUE(ActiveDistance);
            if (ABS(distance) < CONVER_VALUE(ActiveDistance)) {
                CGFloat zoom = 1 + ScaleFactor * (1 - ABS(normalizedDistance)); //放大渐变
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
                attributes.alpha = 1.0;
                NSLog(@"attributes ====== %@",attributes.indexPath);
            }
        }
    }
    return array;

}

#pragma mark -
#pragma mark 约束设定
//是否实时刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return true;
}
//防止报错 先复制attributes
- (NSArray *)getCopyOfAttributes:(NSArray *)attributes {
    NSMutableArray *copyArr = [NSMutableArray new];
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        [copyArr addObject:[attribute copy]];
    }
    return copyArr;
}

@end
