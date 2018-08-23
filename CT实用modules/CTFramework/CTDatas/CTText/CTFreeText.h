//
//  MyFramorks.h
//  HaiBa
//
//  Created by 涛程 on 2017/10/16.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTFreeText : NSObject
/*
 根据文字获取宽度
 * @height 高度
 * @font   字体大小
 * @string 输入的字符窜
 */
+ (CGFloat)CTFreeWithWidth:(CGFloat)height font:(CGFloat)font str:(NSString *)string;
/*
 根据文字获取高度
 * @height 控件的宽度
 * @font   字体大小
 * @string 输入的字符窜
 */
+ (float)getContactHeight:(CGFloat)width font:(CGFloat)font str:(NSString *)string;
/*
 富文本(改变一段话中个别字体大小)：lab.attributedText = attrStr;
 * @Start  字符串中需要改变字体的开始位置
 * @End    Start之后几位数后结束
 * @font   设置字体大小
 * @string 输入的字符串
 */
+ (NSMutableAttributedString *)CTFreeRangeAndMakeRangeStart:(NSInteger )Start MakeRangeEnd:(NSInteger )Emd font:(CGFloat)font str:(NSString *)string;
/*
 * 改变局部字体的颜色
 * @labell  需要改变的labell控件
 * @font    字体大小
 * @range   NSMakeRange(start, 几位数后结束)
 * @vaColor 颜色改变
 */
+ (void)fuwenbenLabel:(UILabel *)labell FontNumber:(CGFloat)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor;
//判断字符串是否为全数字 yes是是，no是不是
+ (BOOL)deptNumInputShouldNumber:(NSString *)str;
//字符串去空处理
+ (NSString *)CTRemoveStrEmpty:(NSString *)str;
@end
