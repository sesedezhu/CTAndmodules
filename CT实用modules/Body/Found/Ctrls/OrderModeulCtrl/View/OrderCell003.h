//
//  OrderCell003.h
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView003.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderCell003 : UITableViewCell
@property(nonatomic ,strong) CellView003 *CellView;
- (void)SetTheCellStyleAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
