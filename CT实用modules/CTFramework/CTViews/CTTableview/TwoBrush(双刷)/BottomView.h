//
//  BottomView.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/8.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewBrush.h"
NS_ASSUME_NONNULL_BEGIN

@interface BottomView : UIView
@property(nonatomic ,strong) TableViewBrush *TableRight;
@property(nonatomic ,strong) TableViewBrush *TableLeft;

@property (nonatomic, copy) void (^BottomViewTableLeftBlock)(NSIndexPath *indexPath,NSString *content);
@property (nonatomic, copy) void (^BottomViewTableRightBlock)(NSIndexPath *indexPath,NSString *content);
@end

NS_ASSUME_NONNULL_END
