//
//  MovieLayout.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "MovieLayout.h"

@implementation MovieLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        //水平方向
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

@end
