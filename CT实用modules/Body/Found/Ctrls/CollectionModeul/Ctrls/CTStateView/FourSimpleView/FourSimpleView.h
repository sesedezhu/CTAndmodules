//
//  FourSimpleView.h
//  CT实用modules
//
//  Created by 涛程 on 2018/8/22.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickButtonBlock)(int tepy);
@interface FourSimpleView : UIView

@property(nonatomic, copy)ClickButtonBlock clickButtonBlocks;
- (void)loadStartTimer:(int)timer clickButtonBlocks:(ClickButtonBlock)block;
@end
