//
//  CTLoginRequest001.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/4/12.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "CTLoginRequest001.h"

//接口地址配置
#define RequestPrefix @"http://hub.naliwan.com"

//登录接口
#define NLWlogin                           @"/userlogin/login"
//4.3.1验证码接口
#define NLWSendDps                         @"/userlogin/sendDps"
//4.12.1用户修改密码接口(包括找回密码)
#define NLWModifyUserPwd                   @"/userpwd/modifyUserPwd"
//用户资料
#define UserPlists @"User.plist"
@interface CTLoginRequest001()
@end
@implementation CTLoginRequest001
//获取网络用户信息账号密码登录
+ (void)getRequestUserAccount:(NSString *)account password:(NSString *)password success:(CTSuccess)success failure:(CTFailed)failure{
    NSMutableDictionary * messageDic = [[NSMutableDictionary alloc]init];
    [messageDic setObject:account forKey:@"mobileNo"];
    [messageDic setObject:[CTMD5Tool MD5ForLower32Bate:password] forKey:@"password"];
    long long times = [[NSString stringWithFormat:@"%d",[DateTimes getCurrentTimeStamp]] longLongValue];
    [messageDic setObject:[NSString stringWithFormat:@"%@%lld",account,times*1000] forKey:@"jiGuangAlias"];
    [messageDic setObject:@"2" forKey:@"loginFlag"];
    [messageDic setObject:@"" forKey:@"parentId"];
    NSString *md5Str = [CTStringTool stringWithDict:messageDic];
    NSString *md5 = [CTMD5Tool MD5ForUpper32Bate:md5Str];
    [messageDic setObject:md5 forKey:@"sign"];
    
    [CTRequest startPostConnectionWithAddress:RequestPrefix Path:NLWlogin parameter:messageDic CaCha:NO cacha:^(id  _Nonnull responseCache) {
        
    } success:^(id  _Nonnull responseObject) {
        success ? success(responseObject) : nil;
        [self writeUserDataInPlist:responseObject];
    } failure:^(NSError * _Nonnull error) {
        failure ? failure(error) : nil;
    }];
}
//获取网络用户信息-手机密码登录
+ (void)getRequestUserMobile:(NSString *)mobile MsgInfo:(NSString *)msgInfo success:(CTSuccess)success failure:(CTFailed)failure{
    NSMutableDictionary * messageDic = [[NSMutableDictionary alloc]init];
    [messageDic setObject:mobile forKey:@"mobileNo"];
    [messageDic setObject:@"4" forKey:@"remarkInfo"];
    [messageDic setObject:msgInfo forKey:@"msgInfo"];
    long long times = [[NSString stringWithFormat:@"%d",[DateTimes getCurrentTimeStamp]] longLongValue];
    [messageDic setObject:[NSString stringWithFormat:@"%@%lld",mobile,times*1000] forKey:@"jiGuangAlias"];
    [messageDic setObject:@"1" forKey:@"loginFlag"];
    [messageDic setObject:@"" forKey:@"parentId"];
    NSString *md5Str = [CTStringTool stringWithDict:messageDic];
    NSString *md5 = [CTMD5Tool MD5ForUpper32Bate:md5Str];
    [messageDic setObject:md5 forKey:@"sign"];
    
    [CTRequest startPostConnectionWithAddress:RequestPrefix Path:NLWlogin parameter:messageDic CaCha:NO cacha:^(id  _Nonnull responseCache) {
        
    } success:^(id  _Nonnull responseObject) {
        success ? success(responseObject) : nil;
        [self writeUserDataInPlist:responseObject];
    } failure:^(NSError * _Nonnull error) {
        failure ? failure(error) : nil;
    }];
}
//获取验证码
+ (void)getVerificationCodeMobile:(NSString *)mobile verificationCodeType:(CTVerificationCodeType)type success:(CTSuccess)success failure:(CTFailed)failure{
    NSString *remarkInfo;
    switch (type) {
        case CTVerificationCodeLogin:
            remarkInfo = @"4";
            break;
        case CTVerificationCodeBack:
            remarkInfo = @"3";
            break;
        default:
            break;
    }
    NSMutableDictionary * messageDic = [[NSMutableDictionary alloc]init];
    [messageDic setObject:mobile forKey:@"mobileNo"];
    [messageDic setObject:remarkInfo forKey:@"remarkInfo"];
    NSString *md5Str = [CTStringTool stringWithDict:messageDic];
    NSString *md5 = [CTMD5Tool MD5ForUpper32Bate:md5Str];
    [messageDic setObject:md5 forKey:@"sign"];
    
    [CTRequest startPostConnectionWithAddress:RequestPrefix Path:NLWSendDps parameter:messageDic CaCha:NO cacha:^(id  _Nonnull responseCache) {
        
    } success:^(id  _Nonnull responseObject) {
        success ? success(responseObject) : nil;
    } failure:^(NSError * _Nonnull error) {
        failure ? failure(error) : nil;
    }];
}
/*
 *  修/找回密码
 */
+ (void)ModifyPasswordsInMobile:(NSString *)mobile MsgInfo:(NSString *)msgInfo password:(NSString *)password loginPasswordType:(CTLoginPasswordType)type success:(CTSuccess)success failure:(CTFailed)failure{
    NSString *modifyFlag;
    switch (type) {
        case CTLoginPasswordModify:
            modifyFlag = @"1";
            break;
        case CTLoginPasswordBack:
            modifyFlag = @"2";
            break;
        default:
            break;
    }
    NSMutableDictionary * messageDic = [[NSMutableDictionary alloc]init];
    [messageDic setObject:mobile forKey:@"mobileNo"];
    [messageDic setObject:msgInfo forKey:@"msgInfo"];
    [messageDic setObject:password forKey:@"password"];
    [messageDic setObject:modifyFlag forKey:@"modifyFlag"];
    [messageDic setObject:@"3" forKey:@"remarkInfo"];
    NSString *md5Str = [CTStringTool stringWithDict:messageDic];
    NSString *md5 = [CTMD5Tool MD5ForUpper32Bate:md5Str];
    [messageDic setObject:md5 forKey:@"sign"];
    
    [CTRequest startPostConnectionWithAddress:RequestPrefix Path:NLWModifyUserPwd parameter:messageDic CaCha:NO cacha:^(id  _Nonnull responseCache) {
        
    } success:^(id  _Nonnull responseObject) {
        success ? success(responseObject) : nil;
    } failure:^(NSError * _Nonnull error) {
        failure ? failure(error) : nil;
    }];
}






//请求成功写入用户信息
+ (void)writeUserDataInPlist:(id)responseObject{
    NSString *errCode = [responseObject objectForKey:@"errCode"];
    if ([errCode isEqualToString:@"00000"]){
        NSDictionary *data = responseObject[@"data"];
        [PlistManager isFilePlistName:UserPlists loadData:data];
    }
}
@end
