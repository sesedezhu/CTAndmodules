//
//  UserManager.h
//  Travels
//
//  Created by 涛程 on 2018/9/3.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject
/**
 *  更新本地plist文件中指定的参数值
 *  value 需要更新的内容
 *  key 本地plist字典中的唯一标识
 */
+ (void)updateUserPlistsAndonlyOnlyValue:(NSString *)value forKey:(NSString *)key;
/**
 *  判断用户是否登录，根据userID进行判断
 */
+ (BOOL)isJudgeLoginUser;
/**
 *  判断用户身份，玩咖/游客
 */
+ (BOOL)isJudgeIdentityUser;
//判断获取的网络url是否包含http头,不包含则添加上默认头http://img.naliwan.com/
+ (NSString *)isNetworkImageview:(NSString *)headerUrl;
//获取默认用户头像
+ (NSString *)getNormalUserHeadImageview;
//获取网络加载头像
+ (NSString *)getUrlUserHeadImageview;
//获取用户昵称
+ (NSString *)isUserRealName;
//获取用户性别
+ (NSString *)isUserSex;
//获取用户年龄
+ (NSString *)isUserBirthDay;
//获取用户职业
+ (NSString *)isUserOccupation;
//获取用户服务区域
+ (NSString *)isUserDistId;
//获取用户语言
+ (NSString *)isUserLang;
//获取用户个人简介
+ (NSString *)isUserIntro;


@end
