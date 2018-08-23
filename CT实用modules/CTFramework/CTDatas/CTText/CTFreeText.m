//
//  MyFramorks.m
//  HaiBa
//
//  Created by 涛程 on 2017/10/16.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "CTFreeText.h"

@implementation CTFreeText
//根据文字获取宽度
+ (CGFloat)CTFreeWithWidth:(CGFloat)height font:(CGFloat)font str:(NSString *)string{
    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize size  = CGSizeMake(1000000000000.0,height);
    NSDictionary * dict  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    size = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.width;
}
//获取文字的高度
+ (float)getContactHeight:(CGFloat)width font:(CGFloat)font str:(NSString *)string
{
    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize maxSize = CGSizeMake(width , MAXFLOAT);
//    NSDictionary *attrs = @{NSFontAttributeName : fonts};
    NSDictionary * attrs  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    // 计算文字占据的高度
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size.height;
    
    
//    //除以控件的默认高度，记得要有个数x.0,不然ceil的向上取整会失败
//    int i = h /CONVER_VALUE(15.0);
//    //向上取整数
//    int c = ceil(i);
}
//改变文字中指定位置的字体大小
+ (NSMutableAttributedString *)CTFreeRangeAndMakeRangeStart:(NSInteger )Start MakeRangeEnd:(NSInteger )Emd font:(CGFloat)font str:(NSString *)string{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:font]
                    range:NSMakeRange(Start, Emd)];
    
    return attrStr;
}
//改变局部字体的颜色
+ (void)fuwenbenLabel:(UILabel *)labell FontNumber:(CGFloat)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:labell.text];
    //设置字号
    
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    labell.attributedText = str;
}
//判断字符串是否为全数字
+ (BOOL)deptNumInputShouldNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}
//字符串去空处理
+ (NSString *)CTRemoveStrEmpty:(NSString *)str{
    
//    str = [NSString stringWithUTF8String:str.UTF8String];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}
@end
