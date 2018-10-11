//
//  MyViewCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/7/31.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "MyViewCtrl.h"
#import "CTCollects.h"

#import "CacheCtrl.h"
#import "TextCtrl.h"
@interface MyViewCtrl ()

@end

@implementation MyViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title =  @"数据类型封装";
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1.本地cache",@"text集合",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtnMy:sender];
    }];
    [self.view addSubview:collview];
}
- (void)ClickBtnMy:(UIButton *)sender{
    switch (sender.tag-1) {
        case 0:
        {
            //一、本地缓存集合
            CacheCtrl *cacha = [[CacheCtrl alloc]init];
            cacha.title = @"本地cache";
            [cacha setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cacha animated:YES];
        }
            break;
        case 1:
        {
            //一、本地缓存集合
            TextCtrl *cacha = [[TextCtrl alloc]init];
            cacha.title = @"text集合";
            [cacha setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cacha animated:YES];
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
