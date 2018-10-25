//
//  StringCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/10/25.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "StringCtrl.h"

@interface StringCtrl ()

@end

@implementation StringCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, kScreenWidth-100, 200)];
    lab.numberOfLines = 0;
    lab.text = @"这个太简单了，本人又太懒，就不创建示例了，对应类CTStringTool";
    [self.view addSubview:lab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
