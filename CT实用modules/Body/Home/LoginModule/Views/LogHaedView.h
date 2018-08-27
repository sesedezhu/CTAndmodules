//
//  LogHaedView.h
//  CT实用modules
//
//  Created by 涛程 on 2018/8/24.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogHaedView : UIView
@property(nonatomic ,strong) UIButton *LeftBtn;
@property(nonatomic ,strong) UIButton *RightBtn;

- (void)SwitchRightBottenSelected:(BOOL)Rightselected; 
@end
