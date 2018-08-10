//
//  CollectionModeul.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CollectionModeul.h"
#import "PosterView.h"
@interface CollectionModeul ()
{
    PosterView *posterView;
}
@end

@implementation CollectionModeul

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:posterView];
    posterView.dataArr = [NSArray arrayWithObjects:@"喜洋洋",@"mei洋洋",@"hua洋洋",@"dou洋洋",@"zhu洋洋",@"zhu洋洋",@"zhu洋洋",@"zhu洋洋",@"zhu洋洋",@"zhu洋洋",@"zhu洋洋",@"zhu洋洋", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
