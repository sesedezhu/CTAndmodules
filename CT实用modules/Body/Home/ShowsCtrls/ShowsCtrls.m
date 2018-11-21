//
//  ShowsCtrls.m
//  CT实用modules
//
//  Created by 涛程 on 2018/11/20.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "ShowsCtrls.h"
#import "CTCollects.h"
#import "CTShowsManager.h"
#import "GiFHUD.h"
@interface ShowsCtrls ()

@end

@implementation ShowsCtrls

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title =  @"弹窗类型展示";
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"普通渐变",@"多图切换",@"单图旋转",@"gif动画",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtn:sender];
    }];
    [self.view addSubview:collview];
    
    
}

- (void)ClickBtn:(UIButton *)sender{
    NSLog(@"啊！我点击了%ld",sender.tag-1);
    switch (sender.tag-1) {
        case 0://一、CTShows 自定义弹窗
        {
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor orangeColor];
            [CTShowsManager CTloadInitContViewTop:kScreenHeight/2-50 Left:kScreenWidth/2-50 Width:100 Height:100 addView:view animationTepy:NLWDefault transparency:YES interaction:YES time:1.0];
        }
            break;
        case 1://多图切换
        {
            NSArray *arr = [NSArray arrayWithObjects:@"HUBGIF001@2x.tiff",@"HUBGIF002@2x.tiff",@"HUBGIF003@2x.tiff",@"HUBGIF004@2x.tiff",@"HUBGIF005@2x.tiff" ,nil];
            [MBProgressHUD showCustomTwoGifHUD:@"来打我啊！" imageArray:arr];
        }
            break;
        case 2://单图旋转
        {
            [MBProgressHUD showCustomGifHUD:@"我转转转" imageName:@"HUBGIF001@2x.tiff"];
        }
            break;
        case 3:
        {
            [GiFHUD setGifWithImageName:@"pika.gif"];
            //            [GiFHUD show];弹出方式一
            [GiFHUD showWithOverlay];//弹窗方式二,全屏幕背景
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [GiFHUD dismiss];
            });
        }
            break;
            
        default:
            break;
    }
}

@end
