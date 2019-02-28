//
//  CTPayView001.h
//  CT实用modules
//
//  Created by 涛程 on 2019/2/28.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTPayView001 : UIView
@property(nonatomic ,strong) UIImageView *PayImage;   //结果图片
@property(nonatomic ,strong) UIButton *LeftBtn;      //左边按钮
@property(nonatomic ,strong) UIButton *RightBtn;      //右边按钮
@property(nonatomic ,strong) UILabel *LabResults;  //结果
@property(nonatomic ,strong) UILabel *LabWarning;  //警示
@end

NS_ASSUME_NONNULL_END


/*     默认高度 293     */
