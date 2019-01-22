//
//  CTControlsManagers.m
//  CT实用modules
//
//  Created by 涛程 on 2019/1/22.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "CTControlsManagers.h"

#define CTLabTextColor       [UIColor blackColor] //默认文字黑色
#define CTLabFont            [UIFont systemFontOfSize:CONVER_VALUE(17)] //默认系统文字大小
#define CTLabAlignment       NSTextAlignmentLeft  //默认左对齐
#define CTLabBackgroundColor [UIColor whiteColor] //默认背景颜色
#define CTLablineBreakMode   NSLineBreakByTruncatingTail //默认小数点位置
#define CTLabFontSizeToFitWidth   NO //默认不开启文字自适应配置
@implementation CTControlsManagers
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
@end
