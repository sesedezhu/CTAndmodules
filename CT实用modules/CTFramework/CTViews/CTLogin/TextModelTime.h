//
//  TextModelTime.h
//  Travels
//
//  Created by 涛程 on 2018/9/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextModelTime : UIView
@property(nonatomic ,strong) UILabel *Lab_name;
@property(nonatomic ,strong) UITextField *Text_content;
@property(nonatomic ,strong) UIButton *Btn_time;
- (void)startTimer;
- (void)EndTimer;
@end
