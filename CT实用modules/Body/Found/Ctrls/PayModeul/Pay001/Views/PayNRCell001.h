//
//  PayNRCell001.h
//  CT实用modules
//
//  Created by 涛程 on 2019/2/28.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView001.h"
NS_ASSUME_NONNULL_BEGIN

@interface PayNRCell001 : UITableViewCell
@property(nonatomic ,strong) CellView001 *CellView;

//主动更新配置信息
- (void)updatePayNRCell001UI;
@end

NS_ASSUME_NONNULL_END
