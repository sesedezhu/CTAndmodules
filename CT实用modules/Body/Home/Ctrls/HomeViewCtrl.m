//
//  HomeViewCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/7/31.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "HomeViewCtrl.h"
#import "CTCollects.h"
#import "CTShowsManager.h"
#import "CollectionModeul.h"
#import "OneSimpleView.h"
#import "TwoSimpleView.h"
@interface HomeViewCtrl ()

@end

@implementation HomeViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title =  @"页面封装类";
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1.自定义弹窗",@"UICollectionView",@"背景状态01",@"背景状态02",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtn:sender];
    }];
    [self.view addSubview:collview];
    
    

}

- (void)ClickBtn:(UIButton *)sender{
    NSLog(@"啊！我点击了%ld",sender.tag-1);
    switch (sender.tag-1) {
        case 0:
        {
            //一、CTShows 自定义弹窗
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor orangeColor];
            [CTShowsManager CTloadInitContViewTop:kScreenHeight/2-50 Left:kScreenWidth/2-50 Width:100 Height:100 addView:view animationTepy:NLWDefault transparency:YES interaction:YES time:1.0];
        }
            break;
        case 1:
        {
            //上下联动，放大缩小动画
            CollectionModeul *collection = [[CollectionModeul alloc]init];
            [collection setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:collection animated:YES];
        }
            break;
        case 2:
        {
            //一、简单背景view
            OneSimpleView *view = [[OneSimpleView alloc]init];
            [CTShowsManager CTloadInitContViewTop:(CTStopStatusRect+CTStopNavRect) Left:0 Width:self.view.frame.size.width Height:self.view.frame.size.height addView:view animationTepy:NLWMobileAndReturnTop transparency:YES interaction:YES time:1.0];
        }
            break;
        case 3:
        {
            //二、简单背景view
            TwoSimpleView *view = [[TwoSimpleView alloc]init];
            [CTShowsManager CTloadInitContViewTop:(CTStopStatusRect+CTStopNavRect) Left:0 Width:self.view.frame.size.width Height:self.view.frame.size.height addView:view animationTepy:NLWMobileAndReturnLeft transparency:YES interaction:YES time:1.0];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
