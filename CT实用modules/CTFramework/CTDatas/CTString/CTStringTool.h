//
//  CTString.h
//  HaiBa
//
//  Created by 涛程 on 2017/12/8.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTStringTool : NSObject
/*
 *  按字典顺序获取value排列起来的字符串
 *  ps:传入的key开头必须是小写字母，不然会出错
 *  @param dict 传入的字典
 */
+ (NSString*)stringWithDict:(NSDictionary*)dict;
/*  将后台返回的单个（数字）对象转化成字符串形式，限制当小数点后的数最多只能显示两位数（四舍五入）
 *  @param dict 传入的对象
 */
+ (NSString*)stringinitID:(id)TherID;
//判断字符串是否为全数字 yes是是，no是不是
+ (BOOL)deptNumInputShouldNumber:(NSString *)str;
//字符串去空处理
+ (NSString *)CTRemoveStrEmpty:(NSString *)str;
@end
//[CTString stringinitID:

