//
//  CTControlsManagers.m
//  CT实用modules
//
//  Created by 涛程 on 2019/1/22.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CTUICtrlsManagers.h"

@implementation CTUIManagers
/*******************  Label  *******************/
#define CTLabTextColor       [UIColor blackColor] //默认文字黑色
#define CTLabFont            [UIFont systemFontOfSize:CONVER_VALUE(17)] //默认系统文字大小
#define CTLabAlignment       NSTextAlignmentLeft  //默认左对齐
#define CTLabBackgroundColor [UIColor whiteColor] //默认背景颜色
#define CTLablineBreakMode   NSLineBreakByTruncatingTail //默认小数点位置
#define CTLabFontSizeToFitWidth   NO //默认不开启文字自适应配置
//创建lable,默认配置
+ (UILabel *)createLabelText:(NSString *)text{
    
    UILabel *CTLab=[[UILabel alloc]init];
    CTLab.text=text;
    CTLab.textColor=CTLabTextColor;
    CTLab.font=CTLabFont;
    CTLab.textAlignment=CTLabAlignment;
    CTLab.backgroundColor=CTLabBackgroundColor;
    CTLab.lineBreakMode = CTLablineBreakMode;
    CTLab.adjustsFontSizeToFitWidth = CTLabFontSizeToFitWidth;
    return CTLab;
}
//创建lable,高度自定义配置
+ (UILabel *)createLabelText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)bgColor{
    
    UILabel *CTLab=[[UILabel alloc]init];
    CTLab.text=text;
    CTLab.textColor=textColor;
    CTLab.font=font;
    CTLab.textAlignment=textAlignment;
    CTLab.backgroundColor=bgColor;
    CTLab.adjustsFontSizeToFitWidth = CTLabFontSizeToFitWidth;
    return CTLab;
}
/*******************  Button  *******************/
//创建Button,默认配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText normalTextColor:(UIColor *)normlTextColor font:(UIFont *)font backgroundColor:(UIColor *)bgColor{
    UIButton *CTBtn = [[UIButton alloc]init];
    [CTBtn setTitle:normlText forState:UIControlStateNormal];
    [CTBtn setTitleColor:normlTextColor forState:UIControlStateNormal];
    CTBtn.titleLabel.font = font;
    [CTBtn setBackgroundColor:bgColor];
    return CTBtn;
}
//创建Button,高度自定义配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText selectedText:(NSString *)selText font:(UIFont *)font normalTextColor:(UIColor *)normlTextColor electedTextColor:(UIColor *)selTextColor backgroundColor:(UIColor *)bgColor backgroundNormalImage:(UIImage *)bgNormalImage backgroundSelectedImage:(UIImage *)bgSelImage{
    UIButton *CTBtn = [[UIButton alloc]init];
    [CTBtn setTitle:normlText forState:UIControlStateNormal];
    [CTBtn setTitle:selText forState:UIControlStateSelected];
    CTBtn.titleLabel.font = font;
    [CTBtn setTitleColor:normlTextColor forState:UIControlStateNormal];
    [CTBtn setTitleColor:selTextColor forState:UIControlStateSelected];
    [CTBtn setBackgroundColor:bgColor];
    [CTBtn setImage:bgNormalImage forState:UIControlStateNormal];
    [CTBtn setImage:bgSelImage forState:UIControlStateSelected];
    return CTBtn;
}
//创建Button,完全自定义配置
+ (UIButton *)createButtonNormalText:(NSString *)normlText selectedText:(NSString *)selText font:(UIFont *)font normalTextColor:(UIColor *)normlTextColor selectedTextColor:(UIColor *)selTextColor contentHorAlignment:(UIControlContentHorizontalAlignment)btnHorAlignment contentVerticalAlignment:(UIControlContentVerticalAlignment)btnVerAlignment backgroundColor:(UIColor *)bgColor LabelAlignment:(NSTextAlignment)labelAlignment backgroundNormalImage:(UIImage *)bgNormalImage backgroundSelectedImage:(UIImage *)bgSelImage cornerRadius:(CGFloat)Radius BorderColor:(CGColorRef)refColor{
    
    UIButton *CTBtn = [[UIButton alloc]init];
    [CTBtn setTitle:normlText forState:UIControlStateNormal];
    [CTBtn setTitle:selText forState:UIControlStateSelected];
    CTBtn.titleLabel.font = font;
    [CTBtn setTitleColor:normlTextColor forState:UIControlStateNormal];
    [CTBtn setTitleColor:selTextColor forState:UIControlStateSelected];
    CTBtn.contentHorizontalAlignment = btnHorAlignment;//按钮中lab的左右距离
    CTBtn.contentVerticalAlignment = btnVerAlignment;  //按钮中lab的上下距离
    [CTBtn setBackgroundColor:bgColor];
    CTBtn.titleLabel.textAlignment = labelAlignment;   //按钮中labk里文字的左右距离
    [CTBtn setImage:bgNormalImage forState:UIControlStateNormal];
    [CTBtn setImage:bgSelImage forState:UIControlStateSelected];
    (!Radius)?0:[self CTBtnRadius:CTBtn Radius:Radius];
    (!refColor)?0:[self CTBtnBorder:CTBtn refColor:refColor];
    return CTBtn;
}
//按钮变圆方法
+(void)CTBtnRadius:(UIButton *)CTBtn Radius:(CGFloat)Radius{
    CTBtn.layer.cornerRadius = Radius;
    CTBtn.clipsToBounds = YES;
}
//按钮线框及颜色设置
+(void)CTBtnBorder:(UIButton *)CTBtn refColor:(CGColorRef)refColor{
    [CTBtn.layer setBorderColor:refColor];
    [CTBtn.layer setBorderWidth:1];
}
/*******************  Image  *******************/
+ (UIImage *)createImageName:(NSString *)Name{
    UIImage *CTIma = [[UIImage alloc]init];
    CTIma = [UIImage imageNamed:Name];
    return CTIma;
}
/*******************  ImageView  *******************/
//创建ImageView,默认配置
+ (UIImageView *)createImageViewURL:(NSString *)urlStr placeholderImage:(NSString *)Name{
    UIImageView *CTImaView = [[UIImageView alloc]init];
    [CTImaView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:Name]];
    return CTImaView;
}
//ImageView变圆方法
+(void)CTImageViewRadius:(UIImageView *)ImaView Radius:(CGFloat)Radius{
    ImaView.layer.cornerRadius = Radius;
    ImaView.clipsToBounds = YES;
}
//ImageView线框及颜色设置
+(void)CTImageViewBorder:(UIImageView *)ImaView refColor:(CGColorRef)refColor{
    [ImaView.layer setBorderColor:refColor];
    [ImaView.layer setBorderWidth:1];
}
/*******************  UIView  *******************/
//创建UIView,默认配置
+ (UIView *)createView{
    UIView *CTView = [[UIView alloc]init];
    return CTView;
}
/*******************  UITextField  *******************/
//创建UITextField,默认配置
+ (UITextField *)createTextFieldPlaceholder:(NSString *)placeholder keyboardType:(UIKeyboardType)keyboardType backgroundColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)textAlignment{
    UITextField *CTField = [[UITextField alloc]init];
    CTField.placeholder = placeholder;
    CTField.keyboardType = keyboardType;
    CTField.backgroundColor = bgColor;
    CTField.textAlignment = textAlignment;
    return CTField;
}
//UITextField变圆方法
+(void)CTTextFieldRadius:(UITextField *)CTField Radius:(CGFloat)Radius{
    CTField.layer.cornerRadius = Radius;
    CTField.clipsToBounds = YES;
}
//UITextField线框及颜色设置
+(void)CTTextFieldBorder:(UITextField *)CTField refColor:(CGColorRef)refColor{
    [CTField.layer setBorderColor:refColor];
    [CTField.layer setBorderWidth:1];
}
/*******************  UITableView  *******************/
//创建UITableView默认配置
+(UITableView *)CTTableViewBackgroundColor:(UIColor *)bgColor separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle style:(UITableViewStyle)style Frame:(CGRect)frame{
    UITableView *CTTableview = [[UITableView alloc]initWithFrame:frame style:style];
    //在iOS11上，默认关掉高度的设置，下面三个方法是打开设置的，请根据需求使用
    CTTableview.estimatedRowHeight = 0;
    CTTableview.estimatedSectionHeaderHeight = 0;
    CTTableview.estimatedSectionFooterHeight = 0;
    //去掉cell之间默认虚线
    CTTableview.separatorStyle = separatorStyle;
    CTTableview.backgroundColor = bgColor;
    return CTTableview;
}
@end
