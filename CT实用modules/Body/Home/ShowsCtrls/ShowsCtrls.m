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
#import "modoulView001.h"
#import "BottomView.h"
#import "ShareView01ct.h"
@interface ShowsCtrls ()

@end

@implementation ShowsCtrls

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title =  @"弹窗类型展示";
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"普通渐变",@"多图切换",@"单图旋转",@"gif动画",@"view",@"self.view弹窗",@"TableBrush", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtn:sender];
    }];
    [self.view addSubview:collview];
    
    
}
- (void)bbbbbbbbbbbbbb{
    NSLog(@"mmda");
}
- (void)ClickBtn:(UIButton *)sender{
    NSLog(@"啊！我点击了%ld",sender.tag-1);
    switch (sender.tag-1) {
        case 0://一、CTShows 自定义弹窗
        {
            ShareView01ct *view = [[ShareView01ct alloc]init];
//            view.backgroundColor = [UIColor orangeColor];
//            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 250, 50, 50)];
//            btn.backgroundColor = [UIColor yellowColor];
//            [view addSubview:btn];
//            [btn addTarget:self action:@selector(bbbbbbbbbbbbbb) forControlEvents:UIControlEventTouchUpInside];
            [CTShowsManager CTloadInitContViewTop:kScreenHeight-CONVER_VALUE(200) Left:0 Width:kScreenWidth Height:CONVER_VALUE(200) addView:view animationTepy:NLWMobileAndReturnBottom transparency:YES interaction:YES time:1.0];
        }
            break;
        case 1://多图切换
        {
            NSArray *arr = [NSArray arrayWithObjects:@"showOne001",@"showOne002",@"showOne003",@"showOne004",@"showOne005",@"showOne006",@"showOne007",@"showOne008",@"showOne009",@"showOne0010",@"showOne0011",@"showOne0012",@"showOne0013",@"showOne0014",@"showOne0015",@"showOne0016" ,nil];
            [MBProgressHUD showCustomTwoGifHUD:@"正在生成订单……" imageArray:arr];
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
        case 4:
        {
            modoulView001 *view = [[modoulView001 alloc]init];
            [CTShowsManager CTloadInitContViewTop:CONVER_VALUE(167) Left:CONVER_VALUE(63) Width:CONVER_VALUE(250) Height:CONVER_VALUE(290) addView:view animationTepy:NLWMobileAndReturnBottom transparency:YES interaction:NO time:1.0];
        }
            break;
        case 5:
        {
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor orangeColor];
            [CTShowsManager CTCustomloadInitContViewTop:kScreenHeight/2-50 Left:kScreenWidth/2-50 Width:100 Height:100 addView:view animationTepy:NLWDefault transparency:YES interaction:YES time:1.0 AndClassView:self.view];
        }
            break;
        case 6:
        {
            BottomView *view = [[BottomView alloc]init];
            [CTShowsManager CTCustomloadInitContViewTop:0 Left:0 Width:kScreenWidth Height:kScreenHeight-100-CTStopStatusRect-CTStopNavRect addView:view animationTepy:NLWMobileAndReturnTop transparency:YES interaction:YES time:1.0 AndClassView:self.view];
            view.BottomViewTableLeftBlock = ^(NSIndexPath * _Nonnull indexPath, NSString * _Nonnull content) {
                NSLog(@"主左--------%ld,%@",(long)indexPath.row,content);
            };
            view.BottomViewTableRightBlock = ^(NSIndexPath * _Nonnull indexPath, NSString * _Nonnull content) {
                NSLog(@"主右--------%ld,%@",(long)indexPath.row,content);
            };
        }
            break;
        default:
            break;
    }
}

@end
