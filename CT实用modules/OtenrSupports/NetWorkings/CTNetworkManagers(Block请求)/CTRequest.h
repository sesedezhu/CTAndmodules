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
/** 请求缓存的Block */
typedef void(^CTHttpRequestCaCha)(id responseCache);
/** 请求成功的Block */
typedef void(^CTHttpRequestSuccess)(id responseObject);
/** 请求失败的Block */
typedef void(^CTHttpRequestFailed)(NSError *error);

@interface CTRequest : NSObject
//get请求
- (void)startGetConnectionWithHeaders:(NSString *)headers Path:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne cacha:(CTHttpRequestCaCha)cacha success:(CTHttpRequestSuccess)success failure:(CTHttpRequestFailed)failure;
//post请求
+ (void)startPostConnectionWithAddress:(NSString *)address Path:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne cacha:(CTHttpRequestCaCha)cacha success:(CTHttpRequestSuccess)success failure:(CTHttpRequestFailed)failure;
//取消指定URL的HTTP请求
+ (void)cancelRequestsNetworkSpecifiedAddress:(NSString *)address Path:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
