//
//  viewcellModel.h
//  drawBoard
//
//  Created by 涛程 on 16/12/1.
//  Copyright © 2016年 dengwei. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 备注：创建多少个view，就要给type多少个顺序数字，用于显示分割线
 数据格式：
 ［｛
 "newsid" : 1111,
 "type" : 1,
 "title" : 1,
 "summary" : 1,
 "image" : 1

 ｝，｛
 ｝］
 */
@interface viewcellModel : NSObject

@property(nonatomic, copy)NSString *qihao;        //期号
@property(nonatomic, copy)NSNumber *serial;       //ui下划线
@property(nonatomic, copy)NSString *qswzh;        //前四位总合

@property(nonatomic, copy)NSString *number_1;
@property(nonatomic, copy)NSString *number_2;
@property(nonatomic, copy)NSString *number_3;
@property(nonatomic, copy)NSString *number_4;
@property(nonatomic, copy)NSString *number_5;
@property(nonatomic, copy)NSString *number_6;
@property(nonatomic, copy)NSString *number_7;
@end
