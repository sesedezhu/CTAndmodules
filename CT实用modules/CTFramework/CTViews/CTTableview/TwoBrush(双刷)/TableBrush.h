//
//  TableBrush.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/9.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableBrush : UITableViewController
/*
 格式要求:
 tapy :表示cell类型
 DataArr:数据内容
 例子:
 [_DataDic setObject:@"0" forKey:@"tapy"];
 [_DataDic setObject:Dataarr forKey:@"DataArr"];
 */
@property (nonatomic ,retain) NSDictionary *BrushDataDic; //唯一数据入口
@end

NS_ASSUME_NONNULL_END
