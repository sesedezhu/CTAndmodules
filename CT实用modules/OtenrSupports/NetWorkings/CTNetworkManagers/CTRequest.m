//
//  CTRequest.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/4/10.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "CTRequest.h"
#import "PPNetworkHelper.h"
@implementation CTRequest
//post请求
+ (void)startPostConnectionWithAddress:(NSString *)address Path:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne cacha:(CTHttpRequestCaCha)cacha success:(CTHttpRequestSuccess)success failure:(CTHttpRequestFailed)failure{
    //1.这个方法是用来进行转码的，即将汉字转码
    path=[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //2.继续转码
    NSString *str= [NSString stringWithFormat:@"%@%@",address,path];;
    str=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //3开启日志打印
    [PPNetworkHelper openLog];
    //4设置请求超时时间:默认为30.0fS
    [PPNetworkHelper setRequestTimeoutInterval:30.0f];
    //5 发送post请求
    if (isOne) {
        [PPNetworkHelper POST:str parameters:parameter responseCache:^(id responseCache) {
            cacha ? cacha(responseCache):nil;
        } success:^(id responseObject) {
            //4.2.2 请求成功
            NSLog(@"有缓存请求成功");
            //转化成json，上架的时候注销
            //            NSData *data1=[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
            //            NSString *jsonStr=[[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding];
            //            NSLog(@"responseObject========%@",jsonStr);
            
            success ? success(responseObject) : nil;
        } failure:^(NSError *error) {
            //4.2.3 请求失败
            NSLog(@"有缓存请求失败");
            
            failure ? failure(error) : nil;
        }];
        
    }else{
        [PPNetworkHelper POST:str parameters:parameter success:^(id responseObject) {
            //4.3.1 请求成功
            NSLog(@"无缓存请求成功");
            //转化成json，上架的时候注销
            //            NSData *data1=[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
            //            NSString *jsonStr=[[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding];
            //            NSLog(@"responseObject========%@",jsonStr);
            success ? success(responseObject) : nil;
        } failure:^(NSError *error) {
            //4.3.2 请求失败
            NSLog(@"无缓存请求失败========%@",error);
            
            failure ? failure(error) : nil;
        }];
    }
}
//取消指定URL的HTTP请求
+ (void)cancelRequestsNetworkSpecifiedAddress:(NSString *)address Path:(NSString *)path{
    //1.这个方法是用来进行转码的，即将汉字转码
    path=[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //2.继续转码
    NSString *str= [NSString stringWithFormat:@"%@%@",address,path];;
    str=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [PPNetworkHelper cancelRequestWithURL:str];
}
/**
 设置网络请求参数的格式:默认为二进制格式
 PPRequestSerializerJSON(JSON格式),
 PPRequestSerializerHTTP(二进制格式)
 
 设置方式 : [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
 */

/**
 设置服务器响应数据格式:默认为JSON格式
 PPResponseSerializerJSON(JSON格式),
 PPResponseSerializerHTTP(二进制格式)
 
 设置方式 : [PPNetworkHelper setResponseSerializer:PPResponseSerializerJSON];
 */

/**
 *  设置请求超时时间:默认为15.0fS
 *
 *  @param time 时长
 设置方式 : [PPNetworkHelper setRequestTimeoutInterval:15.0f];
 
 设置请求头 : [PPNetworkHelper setValue:@"value" forHTTPHeaderField:@"header"];
 */
@end
