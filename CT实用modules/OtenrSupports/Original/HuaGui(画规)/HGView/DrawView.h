//
//  DrawView.h
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView:UIView

@property (assign, nonatomic)CGFloat lineWidth;
@property (strong, nonatomic)UIColor *drawColor;
@property (strong, nonatomic)UIImage *image;
@property (assign, nonatomic)BOOL Line;      //控制画自定义线还是直线开关
-(void)undoStep;
-(void)clearScreen;

@end
