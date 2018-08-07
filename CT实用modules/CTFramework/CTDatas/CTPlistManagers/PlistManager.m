//
//  PlistManager.m
//  CTMediaCloudDemo
//
//  Created by 涛程 on 17/4/18.
//  Copyright © 2017年 Joker. All rights reserved.
//

#import "PlistManager.h"

@implementation PlistManager
/**
 *  判断文件是否存在
 */
+ (BOOL)isFileExistWithFilePlistPath:(NSString *)PlistPath
{
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:PlistPath isDirectory:&isDirectory];
    
}
/**
 *  将数据存入plist文件
 */
+ (void)isFilePlistName:(NSString *)name loadData:(id)data{
    NSString *plistPath = [self getFilePlistPushName:name];
    //写入文件
    [data writeToFile:plistPath atomically:YES];
//    NSLog(@"plistPath文件保存路径==%@",plistPath);
}
/**
 *  将数据存入Data文件
 */
+ (void)isFileDataName:(NSString *)name loadData:(id)data{
    NSString *DataPath = [self getFilePlistPushName:name];
    //创建数据缓冲
    NSMutableData *writer = [[NSMutableData alloc] init];
    //将字符串添加到缓冲中
    [writer appendData:[data dataUsingEncoding:NSUTF8StringEncoding]];
    //将缓冲的数据写入到文件中
    [writer writeToFile:DataPath atomically:YES];
//    NSLog(@"DataPath保存路径==%@",DataPath);
}
/**
 *  根据名字取出plist文件
 */
+ (id)getFilePlists:(NSString *)name{
    NSString *pash = [self getFilePlistPushName:name];
    //判断路径是否存在
    BOOL dataPath = [PlistManager isFileExistWithFilePlistPath:pash];
    id json;
    if (dataPath) {
        json = [NSMutableDictionary dictionaryWithContentsOfFile:pash];
        if (json == nil) {
            json = [NSArray arrayWithContentsOfFile:pash];
        }
        NSLog(@"Plist路径存在");
    }else{
        json = nil;
        NSLog(@"Plist路径不存在");
    }
    
    return json;
}
/**
 *  根据名字取出Data文件
 */
+ (NSString *)getFileDatas:(NSString *)name{
    NSString *pash = [self getFilePlistPushName:name];
    //判断路径是否存在
    BOOL dataPath = [PlistManager isFileExistWithFilePlistPath:pash];
    NSString *str = nil;
    if (dataPath) {
        NSData *data = [NSData dataWithContentsOfFile:pash];
        str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"data路径存在");
    }else{
        NSLog(@"data路径不存在");
    }
   
//    NSLog(@"取出的gata数据为＝＝＝＝＝＝%@",str);
    return str;
}
/**
 *  生成plist文件路径
 */
+ (NSString *)getFilePlistPushName:(NSString *)name{
        //    4.1判断imageName是否存在
    if (name) {
        //    4.2获取Caches的沙盒路径
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *totalPath = [paths objectAtIndex:0];
        //    4.3在Caches的沙盒路径中添加个Plists文件夹路径
        NSString *createPath = [NSString stringWithFormat:@"%@/Plists", totalPath];
        //    4.4判断createPath路径是否存在，也就是Caches中的Plists文件夹是否存在
        BOOL isExist = [self isFileExistWithFilePlistPath:createPath];
        if (!isExist){
            //    4.5不存在就创建Plists文件夹
            [[NSFileManager defaultManager] createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        }else{
            NSLog(@"Caches中的Plists文件夹存在");
        }
        //    4.6在Plists文件夹中添加即将生成的文件的名字
        NSString *plistPath = [createPath stringByAppendingPathComponent:name];
        NSLog(@"即将生成的文件路径＝＝＝＝＝＝%@",plistPath);
        return plistPath;
    }
    return nil;
}
@end
