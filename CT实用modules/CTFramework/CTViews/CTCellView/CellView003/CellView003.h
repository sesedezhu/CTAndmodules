//
//  CellView003.h
//  CT实用modules
//
//  Created by 涛程 on 2019/2/26.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellView003 : UIView
@property(nonatomic ,strong) UILabel *Lab_left;       //cell左侧文案
@property(nonatomic ,strong) UIImageView *Ima_left;  //cell左侧头像图标
@property(nonatomic ,strong) UIButton *Btn_right;      //cell右侧可点击文案，默认隐藏
@property(nonatomic ,strong) UIImageView *Ima_right;   //cell最右侧图标,默认隐藏
@property(nonatomic ,strong) UIView *View_line;       //cell自定义人为线条
- (void)loadCellHiddenStyle:(BOOL)Ima_right;//是否隐藏右边图片,默认隐藏
@end

NS_ASSUME_NONNULL_END


/*     默认高度 53     */
