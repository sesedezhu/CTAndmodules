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

@interface HomeViewCtrl ()

@end

@implementation HomeViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title =  @"页面封装类";

    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1.自定义弹窗",@"未知类型",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        NSLog(@"啊！我点击了%ld",sender.tag-1);
    }];
    [self.view addSubview:collview];
    
    //一、CTShows
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor orangeColor];
    [CTShowsManager CTloadInitContViewTop:kScreenHeight/2-50 Left:kScreenWidth/2-50 Width:150 Height:150 addView:view animationTepy:NLWMobileAndReturnBottom transparency:YES interaction:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
