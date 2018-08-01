//
//  CTCollects.h
//  CT实用modules
//
//  Created by 涛程 on 2018/8/1.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

//tabviewhview
typedef void (^senderBlock)(UIButton *sender);

@interface CTCollects : UIView

@property(nonatomic, copy)senderBlock senderBlock;
- (void)CTloadDataArr:(NSArray *)arr senderBlock:(senderBlock)block;
@end
