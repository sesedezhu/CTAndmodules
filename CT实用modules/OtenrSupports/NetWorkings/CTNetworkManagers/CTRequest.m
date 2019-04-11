//
//  CTRequest.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/4/10.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "CTRequest.h"

@implementation CTRequest
//post请求
- (void)startPostConnectionWithHeaders:(NSString *)headers Path:(NSString *)path parameter:(NSDictionary *)parameter success:(CTHttpRequestSuccess)success failure:(CTHttpRequestFailed)failure{
    //1.这个方法是用来进行转码的，即将汉字转码
    path=[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //2.继续转码
    NSString *str= [NSString stringWithFormat:@"%@%@",headers,path];;
    str=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:type, nil];
    [manager POST:str parameters:parameter headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure ? failure(error) : nil;
    }];
    
}

@end
