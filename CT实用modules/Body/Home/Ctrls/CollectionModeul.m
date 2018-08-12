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
    posterView.dataArr = [NSArray arrayWithObjects:@{@"name":@"程帅哥0",@"image":@"1.jpeg"},@{@"name":@"程帅哥1",@"image":@"2.jpeg"},@{@"name":@"程帅哥2",@"image":@"3.jpeg"},@{@"name":@"程帅哥3",@"image":@"4.jpeg"},@{@"name":@"程帅哥4",@"image":@"5.jpeg"},@{@"name":@"程帅哥5",@"image":@"6.jpeg"},@{@"name":@"程帅哥6",@"image":@"7.jpeg"},@{@"name":@"程帅哥7",@"image":@"8.jpeg"},@{@"name":@"程帅哥8",@"image":@"9.jpeg"}, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
