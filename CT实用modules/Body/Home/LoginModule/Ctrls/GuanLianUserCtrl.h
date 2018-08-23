//
//  GuanLianUserCtrl.h
//  HaiBa
//
//  Created by 涛程 on 2017/8/24.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuanLianUserCtrl : UIViewController
@property (nonatomic, copy)   NSString * NavTitle;
@property (nonatomic, assign) int style;   //必填

@property (nonatomic, copy)   NSString *userId; //用户id
@property (nonatomic, copy)   NSString *is_new_user; //是否新用户


@property (nonatomic, assign) int jdxqlog;   //判断为2时，返回酒店详情页
@end
