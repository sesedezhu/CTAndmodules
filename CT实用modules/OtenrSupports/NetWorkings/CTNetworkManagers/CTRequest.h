//
//  CTRequest.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/4/10.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN
/** 请求成功的Block */
typedef void(^CTHttpRequestSuccess)(id responseObject);
/** 请求失败的Block */
typedef void(^CTHttpRequestFailed)(NSError *error);

@interface CTRequest : NSObject
//post请求
- (void)startPostConnectionWithHeaders:(NSString *)headers Path:(NSString *)path parameter:(NSDictionary *)parameter success:(CTHttpRequestSuccess)success failure:(CTHttpRequestFailed)failure;

@end

NS_ASSUME_NONNULL_END
