//
//  TableViews.m
//  CT实用modules
//
//  Created by 涛程 on 2018/10/8.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "TableViews.h"
#import "CTCollects.h"

#import "TableOne.h"
#import "CellModeuls.h"
@interface TableViews ()

@end

@implementation TableViews

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    __weak typeof(self) weakSelf = self;
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"cell模型列表",@"Table示例一",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
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
            //cell模型列表
            CellModeuls *cell = [[CellModeuls alloc]init];
            [cell setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cell animated:YES];
        }
            break;
        case 1:
        {
            //cell模型列表
            TableOne *cell = [[TableOne alloc]init];
            [cell setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cell animated:YES];
        }
            break;
        case 2:
        {
 
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
