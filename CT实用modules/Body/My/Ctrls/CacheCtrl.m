//
//  CacheCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/7.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CacheCtrl.h"
#import "CTCollects.h"
#import "PlistManager.h"
@interface CacheCtrl ()

@end

@implementation CacheCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1.测试",@"未知类型",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtnCache:sender];
    }];
    [self.view addSubview:collview];
}
- (void)ClickBtnCache:(UIButton *)sender{
    switch (sender.tag-1) {
        case 0:
        {
            //一、测试
//            NSMutableDictionary *mutaDic = [[NSMutableDictionary alloc]init];
            id mutaDic = [PlistManager getFilePlists:@"chengtao"];
            NSLog(@"mutaDic ====== %@",mutaDic);
            
        }
            break;
        case 1:
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
