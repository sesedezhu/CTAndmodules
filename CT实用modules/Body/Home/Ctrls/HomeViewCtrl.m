//
//  HomeViewCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/7/31.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "HomeViewCtrl.h"
#import "CTCollects.h"

//#define Start_X       CONVER_VALUE(20.0f)           // 第一个按钮的X坐标
//#define Start_Y       CONVER_VALUE(10.0f)           // 第一个按钮的Y坐标
//#define Width_Space   CONVER_VALUE(18.0f)           // 2个按钮之间的横间距
//#define Height_Space  CONVER_VALUE(20.0f)           // 竖间距
//#define Button_Height CONVER_VALUE(60.0f)           // 高
//#define Button_Width  CONVER_VALUE(100.0f)           // 宽
//#define Button_font   CONVER_VALUE(17.0f)           // 字体大小
@interface HomeViewCtrl ()
//@property(nonatomic, strong)NSMutableArray *dataArr;
@end

@implementation HomeViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title =  @"页面封装类";

    
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"自定义弹窗",@"未知类型",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        NSLog(@"啊！我点击了%ld",sender.tag-1);
    }];
    [self.view addSubview:collview];
    
    
//    //加载数据源
//    [self loadDate];
//    //加载页面
//    [self loadUI];
    
}
//- (void)loadDate{
//    self.dataArr = [NSMutableArray arrayWithObjects:@"自定义弹窗",@"未知类型",@"未知类型",@"未知类型",@"未知类型",@"未知类型", nil];
//}
//- (void)loadUI{
//    
//    for (int i = 0; i < _dataArr.count; i++) {
//        NSInteger index = i % 3;
//        NSInteger page = i / 3;
//        
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height)];
//        btn.tag = i+1;
//        [btn setTitle:_dataArr[i] forState:UIControlStateNormal];
//        [self.view addSubview:btn];
//        
//        [btn addTarget:self action:@selector(pushCtrls:) forControlEvents:UIControlEventTouchUpInside];
//        
//        btn.backgroundColor = [UIColor grayColor];
//        btn.titleLabel.font = [UIFont systemFontOfSize: Button_font];
//    }
//}
//
//- (void)pushCtrls:(UIButton *)sender{
//    NSLog(@"啊！我点击了%ld",sender.tag-1);
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
