//
//  CTLoginRequest001.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/4/12.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/** 请求成功的Block */
typedef void(^CTSuccess)(id responseObject);
/** 请求失败的Block */
typedef void(^CTFailed)(NSError *error);

@interface CTLoginRequest001 : NSObject
/*
 *  获取网络用户信息-账号密码登录
 */
+ (void)getRequestUserAccount:(NSString *)account password:(NSString *)password success:(CTSuccess)success failure:(CTFailed)failure;
/*
 *  获取网络用户信息-手机密码登录
 */
+ (void)getRequestUserMobile:(NSString *)mobile MsgInfo:(NSString *)msgInfo success:(CTSuccess)success failure:(CTFailed)failure;
//获取验证码
+ (void)getVerificationCodeMobile:(NSString *)mobile success:(CTSuccess)success failure:(CTFailed)failure;
@end

NS_ASSUME_NONNULL_END
