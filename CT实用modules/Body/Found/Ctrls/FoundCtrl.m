//
//  FoundCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/7/31.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "FoundCtrl.h"
#import "CTCollects.h"

#import "CollectionModeul.h"
#import "TableViews.h"
#import "HuaBanCrrl.h"
#import "MyCtrl001.h"
#import "PayCtrls.h"
#import "OrderModeulCtrl.h"
@interface FoundCtrl ()

@end

@implementation FoundCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    __weak typeof(self) weakSelf = self;
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"UICollectionView",@"画板模块",@"UITableView",@"个人中心001",@"支付中心",@"订单模块", nil];
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
            //上下联动，放大缩小动画
            CollectionModeul *collection = [[CollectionModeul alloc]init];
            //            [collection setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:collection animated:YES];
        }
            break;
        case 1:
        {
            HuaBanCrrl *huaban = [[HuaBanCrrl alloc]init];
            [huaban setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:huaban animated:YES];
        }
            break;
        case 2:
        {
            //tableview相关
            TableViews *cell = [[TableViews alloc]init];
            [cell setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cell animated:YES];
        }
            break;
        case 3:
        {
            //tableview相关
            MyCtrl001 *cell = [[MyCtrl001 alloc]init];
            [self.navigationController pushViewController:cell animated:YES];
        }
            break;
        case 4:
        {
            //tableview相关
            PayCtrls *cell = [[PayCtrls alloc]init];
            [cell setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cell animated:YES];
        }
            break;
        case 5:
        {
            //tableview相关
            OrderModeulCtrl *cell = [[OrderModeulCtrl alloc]init];
            [cell setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cell animated:YES];
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
