//
//  oneModelCell.h
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface oneModuleCell : UITableViewCell
@property(nonatomic ,strong) UILabel *Lab_left;        //cell左边文案
@property(nonatomic ,strong) UIButton *Btn_right;      //cell右侧可点击文案
@property(nonatomic ,strong) UIImageView *Ima_right;   //cell最右侧图标
@property(nonatomic ,strong) UIView *View_line;        //cell底部人为线条

- (void)loadCellHiddenStyle:(BOOL)Ima_right;//是否隐藏右边图片,默认不隐藏
@end
/*
 此模型cell高度61
 */

