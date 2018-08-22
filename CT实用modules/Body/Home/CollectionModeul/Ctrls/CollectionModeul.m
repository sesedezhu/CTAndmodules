//
//  CollectionModeul.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CollectionModeul.h"
#import "PosterView.h"
#import "OneSimpleView.h"
#import "TwoSimpleView.h"
@interface CollectionModeul ()
//封装的页面
@property (nonatomic, strong) PosterView *posterViews;
@property (nonatomic, strong) OneSimpleView *oneSimpleViews;
@property (nonatomic, strong) TwoSimpleView *twoSimpleViews;
@end

@implementation CollectionModeul

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 30, 30);
    [menuBtn setImage:[UIImage imageNamed:@"WX_UserImage"] forState:UIControlStateNormal];
    menuBtn.layer.cornerRadius = 15;
    [menuBtn addTarget:self action:@selector(leftBarAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    //创建本页UI
    [self loadUI];
}
- (void)leftBarAction{
    [self AlterShowCustomView:1];
}
#pragma mark - 创建UI
- (void)loadUI{
    
    //有聊天数据
    self.posterViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_posterViews];
    _posterViews.dataArr = [NSMutableArray arrayWithObjects:@{@"name":@"程帅哥0",@"image":@"1.jpeg"},@{@"name":@"程帅哥1",@"image":@"2.jpeg"},@{@"name":@"程帅哥2",@"image":@"3.jpeg"},@{@"name":@"程帅哥3",@"image":@"4.jpeg"},@{@"name":@"程帅哥4",@"image":@"5.jpeg"},@{@"name":@"程帅哥5",@"image":@"6.jpeg"},@{@"name":@"程帅哥6",@"image":@"7.jpeg"},@{@"name":@"程帅哥700000",@"image":@"8.jpeg"},@{@"name":@"程帅哥8",@"image":@"1.jpeg"}, nil];
    __weak typeof(self) weakSelf = self;
    _posterViews.PushPosterViewBlocks = ^(int tag, NSIndexPath *indexPath) {
        [weakSelf pushControllerNext:tag IndexPath:indexPath];
    };
    
    //游客无聊天数据
    self.oneSimpleViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_oneSimpleViews];
    [_oneSimpleViews.btn addTarget:self action:@selector(matchingObjectWK) forControlEvents:UIControlEventTouchDown];
    //玩咖无聊天数据
    self.twoSimpleViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_twoSimpleViews];
}
- (void)matchingObjectWK{
    [self pushControllerNext:1 IndexPath:nil];
}
- (void)pushControllerNext:(int)tag IndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tag ======= %d indexPath.row========= %ld",tag,(long)indexPath.row);
    switch (tag) {
        case 1:{
            NSLog(@"开始匹配玩咖");
            [self AlterShowCustomView:2];
        }
            break;
        case 2:{
            NSLog(@"进入个人资料页面");
            [self AlterShowCustomView:0];
        }
            break;
        case 3:{
            NSLog(@"进入聊天界面");

        }
            break;
        case 4:{
            NSLog(@"数组空，该切换页面了");
        }
            break;
        default:
            break;
    }
}
#pragma mark - 显示的页面方法
- (void)AlterShowCustomView:(int)tepy{
    switch (tepy) {
        case 1://游客、玩咖有聊天数据页面
            _posterViews.hidden = NO;
            _oneSimpleViews.hidden = YES;
            _twoSimpleViews.hidden = YES;
            break;
        case 2://玩咖无聊数据页面
            _posterViews.hidden = YES;
            _oneSimpleViews.hidden = YES;
            _twoSimpleViews.hidden = NO;
            break;
            
        default://默认;游客无聊天数据页面
            _posterViews.hidden = YES;
            _oneSimpleViews.hidden = NO;
            _twoSimpleViews.hidden = YES;
            break;
    }
}
#pragma mark - 懒加载
- (PosterView *)posterViews{
    if (!_posterViews) {
        _posterViews = [[PosterView alloc]init];
        _posterViews.hidden = YES;
    }
    return _posterViews;
}
- (OneSimpleView *)oneSimpleViews{
    if (!_oneSimpleViews) {
        _oneSimpleViews = [[OneSimpleView alloc]init];
    }
    return _oneSimpleViews;
}
- (TwoSimpleView *)twoSimpleViews{
    if (!_twoSimpleViews) {
        _twoSimpleViews = [[TwoSimpleView alloc]init];
        _twoSimpleViews.hidden = YES;
    }
    return _twoSimpleViews;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
