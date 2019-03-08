//
//  CellView008.h
//  CT实用modules
//
//  Created by 涛程 on 2019/3/7.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellView008 : UIView
@property(nonatomic ,strong) UIButton *Btn_left;      //左边按钮
@property(nonatomic ,strong) UIButton *Btn_content;      //中间按钮
@property(nonatomic ,strong) UIButton *Btn_right;      //右边按钮
@property(nonatomic ,strong) UIView *View_line;       //cell自定义人为线条
//更新布局,(写死)只适合一行且2到3个按钮设置
- (void)updateUIAutoWidthFlowItems:(NSArray *)viewsArray;
@end

/**
 * 设置类似collectionView效果的固定间距自动宽度浮动子view
 * viewsArray       : 需要浮动布局的所有视图
 * perRowItemsCount : 每行显示的视图个数
 * verticalMargin   : 视图之间的垂直间距
 * horizontalMargin : 视图之间的水平间距
 * vInset           : 上下缩进值
 * hInset           : 左右缩进值
 */
NS_ASSUME_NONNULL_END
