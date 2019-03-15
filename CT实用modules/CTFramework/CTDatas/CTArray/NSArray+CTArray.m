//
//  NSArray+CTArray.m
//  我度假酒店
//
//  Created by xihasezhu on 2019/3/15.
//  Copyright © 2019 Mac_WF. All rights reserved.
//

#import "NSArray+CTArray.h"

@implementation NSArray (CTArray)
- (id)CT_objectAtIndex:(NSUInteger)index{
    if (index < self.count)
    {
        return self[index];
    }
    else
    {
        MBHUDTitle_Warning(@"数组越界了");
        return nil;
    }
}

@end


@implementation NSMutableArray (NLWArray)

- (id)CT_objectAtIndex:(NSUInteger)index{
    if (index < self.count)
    {
        return self[index];
    }
    else
    {
        MBHUDTitle_Warning(@"数组越界了");
        return nil;
    }
}

@end
