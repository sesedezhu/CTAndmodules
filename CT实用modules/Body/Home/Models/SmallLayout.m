//
//  SmallLayout.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "SmallLayout.h"

//居中卡片宽度与据屏幕宽度比例
static float CardWidthScale = 0.7f;

@implementation SmallLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        //最小行间距
        self.minimumLineSpacing = CONVER_VALUE(14);
    }
    return self;
}

//设置缩放动画
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    //扩大控制范围，防止出现闪屏现象
    CGRect bigRect = rect;
    bigRect.size.width = rect.size.width + 2*[self cellWidth];
    bigRect.origin.x = rect.origin.x - [self cellWidth];
    
    NSArray *arr = [self getCopyOfAttributes:[super layoutAttributesForElementsInRect:bigRect]];
    //屏幕中线
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2.0f;
    //刷新cell缩放
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        CGFloat distance = fabs(attributes.center.x - centerX);
        //移动的距离和屏幕宽度的的比例
        CGFloat apartScale = distance/(self.collectionView.bounds.size.width);
        //把卡片移动范围固定到 -π/4到 +π/4这一个范围内
        CGFloat scale = fabs(cos(apartScale * M_PI/4));
        //设置cell的缩放 按照余弦函数曲线 越居中越趋近于1
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return arr;
}

#pragma mark -
#pragma mark 配置方法

////卡片宽度
- (CGFloat)cellWidth {
    return self.collectionView.bounds.size.width * CardWidthScale;
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
