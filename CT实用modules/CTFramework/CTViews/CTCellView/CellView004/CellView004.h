//
//  CellView004.h
//  CT实用modules
//
//  Created by 涛程 on 2019/2/26.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellView004 : UIView
@property(nonatomic ,strong) UIButton *Btn;      //退出按钮
//主动更新按钮位置
- (void)updateUIFrameTop:(CGFloat)top Left:(CGFloat)left Width:(CGFloat)width Height:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
/*     默认高度 50     */
