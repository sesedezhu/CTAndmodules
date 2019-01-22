//
//  CTControlsManagers.h
//  CT实用modules
//
//  Created by 涛程 on 2019/1/22.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTControlsManagers : NSObject
//创建lable,默认配置
+ (UILabel *)createLabelText:(NSString *)text;
//创建lable,高度自定义配置
+ (UILabel *)createLabelText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)bgColor;

@end

NS_ASSUME_NONNULL_END
