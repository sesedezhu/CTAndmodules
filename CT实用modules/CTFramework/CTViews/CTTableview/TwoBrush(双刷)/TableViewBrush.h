//
//  TableViewBrush.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/23.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewBrush : UITableView<UITableViewDataSource, UITableViewDelegate>
/*
 格式要求:
 tapy :表示页面样式类型
 DataArr:数据内容
 例子:
 [_DataDic setObject:@"0" forKey:@"tapy"];
 [_DataDic setObject:Dataarr forKey:@"DataArr"];
 
 style :表示cell类型
 DataArr数组结构:
 NSDictionary *dic3 = @{@"style":@"1"};
 NSArray *Dataarr = [NSArray arrayWithObjects:dic0,dic1,dic2,dic3, nil];
 */
@property (nonatomic ,retain) NSDictionary *BrushDataDic; //唯一数据入口
@end

NS_ASSUME_NONNULL_END
