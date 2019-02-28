//
//  PayCtrls.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/28.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "PayCtrls.h"
#import "CTCollects.h"

#import "PayCtrl001.h"
@interface PayCtrls ()

@end

@implementation PayCtrls

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    __weak typeof(self) weakSelf = self;
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"支付中心001",@"未知类型",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
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
            PayCtrl001 *huaban = [[PayCtrl001 alloc]init];
            [huaban setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:huaban animated:YES];
        }
            break;
        case 1:
        {
        
        }
            break;
        case 2:
        {
    
        }
            break;
        case 3:
        {
        
        }
            break;
        case 4:
        {
       
        }
            break;
        default:
            break;
    }
}

@end
