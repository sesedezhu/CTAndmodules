//
//  LargeLayout.m
//  WXMovie
//
//  Created by JayWon on 15/9/11.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "LargeLayout.h"

@implementation LargeLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //最小行间距
        self.minimumLineSpacing = CONVER_VALUE(25);
        
    }
    return self;
}

@end
