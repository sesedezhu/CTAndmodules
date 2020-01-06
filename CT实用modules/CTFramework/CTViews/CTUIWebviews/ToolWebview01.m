//
//  ToolWebview01.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/12/13.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "ToolWebview01.h"

@implementation ToolWebview01
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    UILabel *labtext = [[UILabel alloc]init];
    labtext.text = @"用户须知";
    labtext.textColor = [UIColor blackColor];
    labtext.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labtext];
    
    _referralWebView = [[ToolWKWebView01 alloc] init];
    
    [self addSubview:_referralWebView];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"确    认" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//按钮中lab的左右距离
    btn.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;  //按钮中lab的上下距离
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    [self addSubview:btn];
   
    UIView *view = self;
    labtext.sd_layout
    .topSpaceToView(view, CONVER_VALUE(10))
    .leftSpaceToView(view, CONVER_VALUE(10))
    .rightSpaceToView(view, CONVER_VALUE(10))
    .heightIs(CONVER_VALUE(30));
    
    _referralWebView.sd_layout
    .topSpaceToView(labtext, CONVER_VALUE(15))
    .leftEqualToView(labtext)
    .rightEqualToView(labtext)
    .heightIs(CONVER_VALUE(300));
    
    btn.sd_layout
    .topSpaceToView(_referralWebView, CONVER_VALUE(20))
    .leftEqualToView(labtext)
    .rightEqualToView(labtext)
    .heightIs(CONVER_VALUE(50));
    
}
 

@end
