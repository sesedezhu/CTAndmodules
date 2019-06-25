//
//  HGViewController.h
//  商报彩票
//
//  Created by 涛程 on 16/12/2.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>
//画布
#import "DrawView.h"
//工具栏
#import "ToolView.h"
//背景
#import "viewcell.h"
#import "viewcellModel.h"

@interface HBViewController : UIViewController
//画布
@property (weak, nonatomic)DrawView *drawView;
//判断进入时是否加载数据
@property (assign, nonatomic)BOOL Load;
@end
