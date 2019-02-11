//
//  TextModelTime.h
//  Travels
//
//  Created by 涛程 on 2018/9/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextModelTime : UIView
@property(nonatomic ,strong) UILabel *Lab_name;  //标题提示文案
@property(nonatomic ,strong) UITextField *Text_content; //输入内容
@property(nonatomic ,strong) UIButton *Btn_time;  //验证码按钮
- (void)startTimer; //开始倒计时
- (void)EndTimer;  //结束倒计时
@end
