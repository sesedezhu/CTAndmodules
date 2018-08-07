//
//  PlistManager.h
//  CTMediaCloudDemo
//
//  Created by 涛程 on 17/4/18.
//  Copyright © 2017年 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistManager : NSObject
/**
 *  根据路径判断文件是否存在
 */
+ (BOOL)isFileExistWithFilePlistPath:(NSString *)PlistPath;
/**
 *  将数据存入plist文件->直接调用
 *  （判断路径是否存在？存在，存入更改：不存在，创建新路径，生产新plist文件）
 */
+ (void)isFilePlistName:(NSString *)name loadData:(id)data;
/**
 *  将数据存入Data文件->直接调用
 *  （判断路径是否存在？存在，存入更改：不存在，创建新路径，生产新Data文件）
 *   name  命名格式：xxx.plist
 */
+ (void)isFileDataName:(NSString *)name loadData:(id)data;
/**
 *  根据名字以数组的方式取出plist文件，会走生成plist文件路径方法->不能建议直接调用
 *  （ps：调用此方法前需要先判断文件是否存在，避免取值时候崩溃）
 */
+ (id)getFilePlists:(NSString *)name;
/**
 *  根据名字取出Data文件，会走生成Data文件路径方法->不能建议直接调用
 *  （ps：调用此方法前需要先判断文件是否存在，避免取值时候崩溃）
 */
+ (NSString *)getFileDatas:(NSString *)name;
/**
 *  生成plist文件路径
 *  (ps：此步骤不会生成文件，只会生成文件路径)
 */
+ (NSString *)getFilePlistPushName:(NSString *)name;
@end
 
