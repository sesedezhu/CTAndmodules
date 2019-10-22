//
//  ShareView01ct.h
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/17.
//  Copyright © 2019 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareView01ct : UIView
/** 自定义样式判断，yes为登录状态，no为没登录状态 */
@property (nonatomic, assign) BOOL isSheetViewBool;    //必填
/** 自定义样式判断，yes为隐藏取消栏文案信息 */
@property (nonatomic, assign) BOOL isSheetCancelLabel; //逻辑必填
//取消栏文案赋值
@property (nonatomic, copy) NSString *CancelLabelStr;  //逻辑必填
/** 底部取消Button, 默认标题为"取消" */
@property (nonatomic, readonly) UIButton *cancelButton;
@end

NS_ASSUME_NONNULL_END
