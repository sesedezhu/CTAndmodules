//
//  oneModelCell.h
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface oneModelCell : UITableViewCell
@property(nonatomic ,strong) UILabel *Lab_left;
@property(nonatomic ,strong) UIButton *Btn_right;
@property(nonatomic ,strong) UIImageView *Ima_right;
@property(nonatomic ,strong) UIView *View_line;

- (void)loadCellHiddenStyle:(BOOL)Ima_right;//是否隐藏右边图片,默认不隐藏
@end
