//
//  TextModelTime2.h
//  CT实用modules
//
//  Created by chengtao on 2019/2/10.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeccodeView002 : UIView
@property(nonatomic ,strong) UIImageView *letImageView;
@property(nonatomic ,strong) UITextField *Text_content;
@property(nonatomic ,strong) UIButton *Btn_time;
- (void)startTimer;
- (void)EndTimer;
@end
//高67
NS_ASSUME_NONNULL_END
