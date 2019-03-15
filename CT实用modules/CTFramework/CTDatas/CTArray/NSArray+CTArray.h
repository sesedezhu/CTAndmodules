//
//  NSArray+CTArray.h
//  我度假酒店
//
//  Created by xihasezhu on 2019/3/15.
//  Copyright © 2019 Mac_WF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (CTArray)
//数组防越界取值方法
- (id)CT_objectAtIndex:(NSUInteger)index;
@end


@interface NSMutableArray (NLWArray)
//数组防越界取值方法
- (id)CT_objectAtIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END
