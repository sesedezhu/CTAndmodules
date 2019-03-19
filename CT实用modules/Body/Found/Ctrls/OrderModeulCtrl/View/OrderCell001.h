//
//  OrderCell001.h
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView001.h"

NS_ASSUME_NONNULL_BEGIN
//定义ValueBlock类型
typedef void (^timerExampleValueBlock)(void);
@interface OrderCell001 : UITableViewCell
@property(nonatomic, copy)timerExampleValueBlock ExampleValueBlock;
@property(nonatomic ,strong) CellView001 *CellView;
- (void)SetTheCellStyleAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
