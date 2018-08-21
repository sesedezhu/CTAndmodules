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

@property (nonatomic, strong) PosterView *posterView;
@end

@implementation CollectionModeul

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    //创建本页UI
    [self loadUI];
}
#pragma mark - 创建UI
- (void)loadUI{
    
    self.posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_posterView];
    _posterView.dataArr = [NSMutableArray arrayWithObjects:@{@"name":@"程帅哥0",@"image":@"1.jpeg"},@{@"name":@"程帅哥1",@"image":@"2.jpeg"},@{@"name":@"程帅哥2",@"image":@"3.jpeg"},@{@"name":@"程帅哥3",@"image":@"4.jpeg"},@{@"name":@"程帅哥4",@"image":@"5.jpeg"},@{@"name":@"程帅哥5",@"image":@"6.jpeg"},@{@"name":@"程帅哥6",@"image":@"7.jpeg"},@{@"name":@"程帅哥700000",@"image":@"8.jpeg"},@{@"name":@"程帅哥8",@"image":@"1.jpeg"}, nil];
    __weak typeof(self) weakSelf = self;
    _posterView.PushPosterViewBlocks = ^(int tag, NSIndexPath *indexPath) {
        [weakSelf pushControllerNext:tag IndexPath:indexPath];
    };
}
- (void)pushControllerNext:(int)tag IndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tag ======= %d indexPath.row========= %ld",tag,(long)indexPath.row);
    switch (tag) {
        case 1:{
            NSLog(@"开始匹配玩咖");
        }
            break;
        case 2:{
            NSLog(@"进入个人资料页面");
        }
            break;
        case 3:{
            NSLog(@"进入聊天界面");
        }
            break;
        default:
            break;
    }
}

- (PosterView *)posterView{
    if (!_posterView) {
        _posterView = [[PosterView alloc]init];
    }
    return _posterView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
