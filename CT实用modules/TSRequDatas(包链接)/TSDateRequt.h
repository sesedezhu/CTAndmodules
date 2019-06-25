//
//  TSDateRequt.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/6/25.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 请求成功的Block */
typedef void(^TSSuccess)(NSString *uel);

@interface TSDateRequt : NSObject
+(void)loadNetworkTSSuccess:(TSSuccess)success;
@end

NS_ASSUME_NONNULL_END
