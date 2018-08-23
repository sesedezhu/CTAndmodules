//
//  CTString.m
//  HaiBa
//
//  Created by 涛程 on 2017/12/8.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "CTString.h"

@implementation CTString
+ (NSString*)stringWithDict:(NSDictionary*)dict{
    
    NSArray*keys = [dict allKeys];
    
    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
        
        return[obj1 compare:obj2 options:NSNumericSearch];
        
    }];
    
    NSString*str =@"";
    
    for(NSString*categoryId in sortedArray) {
        
        id value = [dict objectForKey:categoryId];
        
        if([value isKindOfClass:[NSDictionary class]]) {
            
            value = [self stringWithDict:value];
            
        }
        
        //NSLog(@"[dict objectForKey:categoryId] === %@",[dict objectForKey:categoryId]);
        
        //        if([str length] !=0) {
        //
        //            str = [str stringByAppendingString:@";"];
        //
        //        }
        
        str = [str stringByAppendingFormat:@"%@",value];
        
    }
    //哪里玩专属
    str = [str stringByAppendingFormat:@"naliwan"];
    return str;
    
}
+ (NSString*)stringinitID:(id)TherID{
    //用于返回的字段
    NSString *Money = nil;
    //将传过来的字段统一转成NSString类型
    NSString *payPriceStr = [NSString stringWithFormat:@"%@",TherID];
    //通过小数点分割字段放入数组
    NSArray *arr = [payPriceStr componentsSeparatedByString:@"."];
    //判断数组是否有小数点，大于1则有
    if (arr.count>1) {
        //获取小数点后的字符串
        NSString *str2 = arr[1];
        //长度大于2，转化成double类型返回
        if (str2.length>2) {
            double payPrice = [payPriceStr doubleValue];
//            //截取掉下标2之后的字符串
//            Money = [str2 substringToIndex:2];
            Money = [NSString stringWithFormat:@"%.2f",payPrice];
            NSLog(@"Money ========= %@",Money);
        }else{
            Money = payPriceStr;
        }
        
    }else{
        Money = payPriceStr;
    }
    
    return Money;
}

@end
