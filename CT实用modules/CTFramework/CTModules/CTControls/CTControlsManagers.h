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

//创建Button,默认配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText normalTextColor:(UIColor *)normlTextColor font:(UIFont *)font backgroundColor:(UIColor *)bgColor;
//创建Button,高度自定义配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText selectedText:(NSString *)selText font:(UIFont *)font normalTextColor:(UIColor *)normlTextColor electedTextColor:(UIColor *)selTextColor backgroundColor:(UIColor *)bgColor backgroundNormalImage:(UIImage *)bgNormalImage backgroundSelectedImage:(UIImage *)bgSelImage;
//创建Button,完全自定义配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText selectedText:(NSString *)selText font:(UIFont *)font normalTextColor:(UIColor *)normlTextColor selectedTextColor:(UIColor *)selTextColor contentHorAlignment:(UIControlContentHorizontalAlignment)btnHorAlignment contentVerticalAlignment:(UIControlContentVerticalAlignment)btnVerAlignment backgroundColor:(UIColor *)bgColor LabelAlignment:(NSTextAlignment)labelAlignment backgroundNormalImage:(UIImage *)bgNormalImage backgroundSelectedImage:(UIImage *)bgSelImage cornerRadius:(CGFloat)Radius BorderColor:(CGColorRef)refColor;
//按钮变圆方法
+(void)CTBtnRadius:(UIButton *)CTBtn Radius:(CGFloat)Radius;
//按钮线框及颜色设置
+(void)CTBtnBorder:(UIButton *)CTBtn refColor:(CGColorRef)refColor;

//创建image,默认配置
+ (UIImage *)createImageName:(NSString *)Name;
//创建ImageView,默认配置
+ (UIImageView *)createImageViewURL:(NSString *)urlStr placeholderImage:(NSString *)Name;
+(void)CTImageViewRadius:(UIImageView *)ImaView Radius:(CGFloat)Radius;
+(void)CTImageViewBorder:(UIImageView *)ImaView refColor:(CGColorRef)refColor;

//创建UIView,默认配置
+ (UIView *)createView;

//创建UITextField,默认配置
+ (UITextField *)createTextFieldPlaceholder:(NSString *)placeholder keyboardType:(UIKeyboardType)keyboardType backgroundColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;
//UITextField变圆方法
+(void)CTTextFieldRadius:(UITextField *)CTField Radius:(CGFloat)Radius;
//UITextField线框及颜色设置
+(void)CTTextFieldBorder:(UITextField *)CTField refColor:(CGColorRef)refColor;

//创建UITableView默认配置
+(UITableView *)CTTableViewBackgroundColor:(UIColor *)bgColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;
@end

NS_ASSUME_NONNULL_END
