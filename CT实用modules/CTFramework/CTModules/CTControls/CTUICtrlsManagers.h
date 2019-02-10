//
//  CTControlsManagers.h
//  CT实用modules
//
//  Created by 涛程 on 2019/1/22.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 __nullable指代对象可以为NULL或者为NIL
 __nonnull指代对象不能为null
 */
NS_ASSUME_NONNULL_BEGIN

@interface CTUICtrlsManagers : NSObject
//创建lable,默认配置
+ (UILabel *)createLabelText:(NSString *)text;
//创建lable,高度自定义配置
+ (UILabel *)createLabelText:(NSString *)text textColor:(UIColor *__nullable)textColor font:(UIFont *__nullable)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *__nullable)bgColor;

//创建Button,默认配置
+ (UIButton *)createButtonNormalText:(NSString *__nullable)normlText normalTextColor:(UIColor *__nullable)normlTextColor font:(UIFont *__nullable)font backgroundColor:(UIColor *__nullable)bgColor;
//创建Button,高度自定义配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText selectedText:(NSString *)selText font:(UIFont *__nullable)font normalTextColor:(UIColor *)normlTextColor electedTextColor:(UIColor *)selTextColor backgroundColor:(UIColor *__nullable)bgColor backgroundNormalImage:(UIImage *__nullable)bgNormalImage backgroundSelectedImage:(UIImage *__nullable)bgSelImage;
//创建Button,完全自定义配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText selectedText:(NSString *)selText font:(UIFont *__nullable)font normalTextColor:(UIColor *)normlTextColor selectedTextColor:(UIColor *)selTextColor contentHorAlignment:(UIControlContentHorizontalAlignment)btnHorAlignment contentVerticalAlignment:(UIControlContentVerticalAlignment)btnVerAlignment backgroundColor:(UIColor *__nullable)bgColor LabelAlignment:(NSTextAlignment)labelAlignment backgroundNormalImage:(UIImage *__nullable)bgNormalImage backgroundSelectedImage:(UIImage *__nullable)bgSelImage cornerRadius:(CGFloat)Radius BorderColor:(CGColorRef)refColor;
//按钮变圆方法
+(void)CTBtnRadius:(UIButton *)CTBtn Radius:(CGFloat)Radius;
//按钮线框及颜色设置
+(void)CTBtnBorder:(UIButton *)CTBtn refColor:(CGColorRef)refColor;

//创建image,默认配置
+ (UIImage *)createImageName:(NSString *)Name;
//创建ImageView,默认配置
+ (UIImageView *)createImageViewURL:(NSString *__nullable)urlStr placeholderImage:(NSString *__nullable)Name;
+(void)CTImageViewRadius:(UIImageView *)ImaView Radius:(CGFloat)Radius;
+(void)CTImageViewBorder:(UIImageView *)ImaView refColor:(CGColorRef)refColor;

//创建UIView,默认配置
+ (UIView *)createView;

//创建UITextField,默认配置
+ (UITextField *)createTextFieldPlaceholder:(NSString *__nullable)placeholder keyboardType:(UIKeyboardType)keyboardType backgroundColor:(UIColor *__nullable)color textAlignment:(NSTextAlignment)textAlignment;
//UITextField变圆方法
+(void)CTTextFieldRadius:(UITextField *)CTField Radius:(CGFloat)Radius;
//UITextField线框及颜色设置
+(void)CTTextFieldBorder:(UITextField *)CTField refColor:(CGColorRef)refColor;

//创建UITableView默认配置
+(UITableView *)CTTableViewBackgroundColor:(UIColor *__nullable)bgColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;
@end

NS_ASSUME_NONNULL_END
