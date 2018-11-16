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
@interface FoundCtrl ()

@end

@implementation FoundCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    __weak typeof(self) weakSelf = self;
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"UICollectionView",@"画板模块",@"UITableView",@"未知类型",@"未知类型",@"未知类型", nil];
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
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
