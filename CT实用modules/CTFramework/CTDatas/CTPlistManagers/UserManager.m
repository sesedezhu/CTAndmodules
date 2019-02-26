//
//  UserManager.m
//  Travels
//
//  Created by 涛程 on 2018/9/3.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "UserManager.h"
@implementation UserManager

//更新本地用户信息
+ (void)mergeUserPlistsUserDicWithObject:(NSString *)obj forKey:(NSString*)key{
    NSMutableDictionary *mutaDic = [PlistManager getFilePlists:UserPlists];
    [mutaDic setObject:obj forKey:key];
    [PlistManager isFilePlistName:UserPlists loadData:mutaDic];
}
/**
 *  更新本地plist文件中指定的参数值
 *  value 需要更新的内容
 *  key 本地plist字典中的唯一标识
 */
+ (void)updateUserPlistsAndonlyOnlyValue:(NSString *)value forKey:(NSString *)key{
    NSMutableDictionary *mutaDic = [[NSMutableDictionary alloc]init];
    mutaDic = [PlistManager getFilePlists:UserPlists];
    [mutaDic removeObjectForKey:key];
    [mutaDic setValue:value forKey:key];
    [PlistManager isFilePlistName:UserPlists loadData:mutaDic];
}
/**
 *  判断用户是否登录，根据userID进行判断
 */
+ (BOOL)isJudgeLoginUser{
    NSDictionary *mutaDic = [PlistManager getFilePlists:UserPlists];
    if (mutaDic == nil) {
        return NO;
    }else{
        NSString *userid = [NSString stringWithFormat:@"%@",mutaDic[@"userId"]];
        userid = [CTStringTool CTRemoveStrEmpty:userid];//去空处理
        if (userid.length>0 && ![userid isEqualToString:@""]) {
            return YES;
        }else{
            return NO;
        }
    }
}
/**
 *  判断用户身份，玩咖/游客
 */
+ (BOOL)isJudgeIdentityUser{
    NSDictionary *mutaDic = [PlistManager getFilePlists:UserPlists];
    if (![UserManager isJudgeLoginUser]) {
        return NO;
    }else{
        NSString *profitType = mutaDic[@"playerType"];
//        profitType = [NSString stringWithFormat:@"%@",mutaDic[@"playerType"]];//1.是玩咖，0是游客和普通用户
        profitType = [CTStringTool CTRemoveStrEmpty:profitType];//去空处理
        if (profitType.length>0 && ![profitType isEqualToString:@""] ) {
            if ([profitType isEqualToString:@"0"]) {
                return NO;
            }else{
                return YES;
            }
        }else{
            return NO;
        }
    }
}
//判断获取的网络url是否包含http头,不包含则添加上默认头http://img.naliwan.com/
+ (NSString *)isNetworkImageview:(NSString *)headerUrl{
    if ((headerUrl.length>0) &&(headerUrl.length<=3) ) {
        headerUrl = [NSString stringWithFormat:@"http://img.naliwan.com/%@",headerUrl];
        return headerUrl;
    }else if (headerUrl.length>=4){
        NSString *header = [headerUrl substringToIndex:4];
        if ([header isEqualToString:@"http"]) {
            return headerUrl;
        }else{
            headerUrl = [NSString stringWithFormat:@"http://img.naliwan.com/%@",headerUrl];
            return headerUrl;
        }
    }else{
        headerUrl = nil;
    }
    return headerUrl;
}
//获取默认用户头像
+ (NSString *)getNormalUserHeadImageview{
    NSString *ima = @"MyUserImage001"; //登录前默认头像UserImagedefule
    if ([UserManager isJudgeLoginUser]){
    ima = @"MyUserImage001";//登录后无值时默认头像
    }
 
    return ima;
}
//获取网络加载用户头像
+ (NSString *)getUrlUserHeadImageview{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *imaurl =nil;
    if ([UserManager isJudgeLoginUser]){
        NSString *photo     = UserDic[@"photo"];
        imaurl = [UserManager isNetworkImageview:photo];
    }
    return imaurl;
}
//获取用户昵称
+ (NSString *)isUserRealName{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *realName = nil;
    if ([UserManager isJudgeLoginUser]){
        realName = UserDic[@"realName"];
    }
    return realName;
}
//获取用户性别
+ (NSString *)isUserSex{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *sex = nil;
    if ([UserManager isJudgeLoginUser]){
        sex = @"保密";
        if ([UserDic[@"sex"] isEqualToString:@"1"]) {
            sex = @"男";
        }else if ([UserDic[@"sex"] isEqualToString:@"0"]){
            sex = @"女";
        }
    }
    return sex;
}
//获取用户年龄
+ (NSString *)isUserBirthDay{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *birthDay = nil;
    if ([UserManager isJudgeLoginUser]){
        birthDay = [NSString stringWithFormat:@"%@",UserDic[@"birthDay"]];
        long long ht = [birthDay longLongValue]; // 后台时间戳
        long long jt = [DateTimes getCurrentTimeStamp]; //今天时间戳
        if ([birthDay isEqualToString:@""]||birthDay == nil || [birthDay isEqual:nil]) {
            birthDay = @"保密";
        }else{
            long long day = (jt - (ht/1000))/365/24/60/60;
            birthDay = [NSString stringWithFormat:@"%lld",day];
        }
    }
    return birthDay;
}
//获取用户职业
+ (NSString *)isUserOccupation{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *occupation = nil;
    if ([UserManager isJudgeLoginUser]){
        occupation = UserDic[@"occupation"];
        if ([occupation isEqualToString:@""]||occupation == nil || [occupation isEqual:nil]) {
            occupation = @"保密";
        }
    }
    return occupation;
}
//获取用户服务区域
+ (NSString *)isUserDistId{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *regionCity = nil;
    if ([UserManager isJudgeLoginUser]){
        regionCity = UserDic[@"regionCity"];
        if ([regionCity isEqualToString:@""]||regionCity == nil || [regionCity isEqual:nil]) {
            regionCity = @"无";
        }
    }
    return regionCity;
}
//获取用户语言
+ (NSString *)isUserLang{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *lang = nil;
    if ([UserManager isJudgeLoginUser]){
        lang = UserDic[@"lang"];
        if ([lang isEqualToString:@""]||lang == nil || [lang isEqual:nil]) {
            lang = @"无";
        }
    }
    return lang;
}
//获取用户个人简介
+ (NSString *)isUserIntro{
    NSDictionary *UserDic = [PlistManager getFilePlists:UserPlists];
    NSString *intro = @"这个人很懒，什么都没留下";
    if ([UserManager isJudgeLoginUser]){
        NSString *introtwo = [CTStringTool CTRemoveStrEmpty:UserDic[@"intro"]];//去空处理
        if (introtwo.length>0 && ![introtwo isEqualToString:@""]) {
            intro =UserDic[@"intro"];
        }
    }
    return intro;
}

////获取当前时间的时间戳
- (NSString*)getCurrentTimestamp{
    
    NSDate* data= [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval interval=[data timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%0.f", interval];//转为字符型
    
    return timeString;
    
}
@end
