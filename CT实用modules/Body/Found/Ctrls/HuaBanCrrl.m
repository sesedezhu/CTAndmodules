//
//  HuaBanCrrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/11/16.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "HuaBanCrrl.h"
#import "CTCollects.h"

#import "HBViewController.h"
#import "HGViewController.h"
@interface HuaBanCrrl ()
@property (nonatomic, strong) HBViewController *hb;
@property (nonatomic, strong) HGViewController *hg;
@end

@implementation HuaBanCrrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    __weak typeof(self) weakSelf = self;
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"画规",@"签名画板",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
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
           [self presentViewController:self.hg animated:YES completion:nil];
        }
            break;
        case 1:
        {
          [self presentViewController:self.hb animated:YES completion:nil];
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
    
}

- (HBViewController *)hb{
    if (!_hb) {
        _hb = [[HBViewController alloc]init];
        //        _hg.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    }
    return _hb;
}
- (HGViewController *)hg{
    if (!_hg) {
        _hg = [[HGViewController alloc]init];
        //        _hg.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    }
    return _hg;
}
@end
