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
#import "ThreeSimpleView.h"
#import "FourSimpleView.h"
@interface CollectionModeul ()
//封装的页面
@property (nonatomic, strong) PosterView *posterViews;
@property (nonatomic, strong) OneSimpleView *oneSimpleViews;
@property (nonatomic, strong) TwoSimpleView *twoSimpleViews;
@property (nonatomic, strong) ThreeSimpleView *threeSimpleViews;
@property (nonatomic, strong) FourSimpleView *fourSimpleViews;
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    //创建本页UI
    [self loadUI];
}
- (void)leftBarAction{
    [self AlterShowCustomView:1];
}
#pragma mark - 创建UI
- (void)loadUI{
    
    //有聊天数据页面
    self.posterViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_posterViews];
    _posterViews.dataArr = [NSMutableArray arrayWithObjects:@{@"name":@"程帅哥0",@"image":@"1.jpeg"},@{@"name":@"程帅哥1",@"image":@"2.jpeg"},@{@"name":@"程帅哥2",@"image":@"3.jpeg"},@{@"name":@"程帅哥3",@"image":@"4.jpeg"},@{@"name":@"程帅哥4",@"image":@"5.jpeg"},@{@"name":@"程帅哥5",@"image":@"6.jpeg"},@{@"name":@"程帅哥6",@"image":@"7.jpeg"},@{@"name":@"程帅哥700000",@"image":@"8.jpeg"},@{@"name":@"程帅哥8",@"image":@"1.jpeg"}, nil];
    __weak typeof(self) weakSelf = self;
    _posterViews.PushPosterViewBlocks = ^(int tag, NSIndexPath *indexPath) {
        [weakSelf pushControllerNext:tag IndexPath:indexPath];
    };
    
    //游客无聊天数据页面
    self.oneSimpleViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_oneSimpleViews];
    [_oneSimpleViews.btn addTarget:self action:@selector(matchingObjectWK) forControlEvents:UIControlEventTouchDown];
    
    //玩咖无聊天数据页面
    self.twoSimpleViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_twoSimpleViews];
    
    //匹配中的页面
    self.threeSimpleViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_threeSimpleViews];
    [_threeSimpleViews.btn addTarget:self action:@selector(noMatchingObjectWK) forControlEvents:UIControlEventTouchDown];
    
    //取消匹配页面
    self.fourSimpleViews.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CTStopStatusRect - CTStopNavRect -CTStopTabBarRect);
    [self.view addSubview:_fourSimpleViews];
    
}
#pragma mark - 点击事件
//匹配按钮点击事件
- (void)matchingObjectWK{
    [self AlterShowCustomView:3];
}
//取消匹配按钮点击事件
- (void)noMatchingObjectWK{
    [self AlterShowCustomView:4];
    
    __weak typeof(self) weakSelf = self;
    //启动定时器并设置点击事件
    [_fourSimpleViews loadStartTimer:10 clickButtonBlocks:^(int tepy) {
        [weakSelf ClickButtonFourSimpleView:tepy];
    }];
}
//取消匹配页面的点击事件
- (void)ClickButtonFourSimpleView:(int)tepy{
    [self AlterShowCustomView:tepy];
}
//有数据页面中的点击事件
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
            _threeSimpleViews.hidden = YES;
            _fourSimpleViews.hidden = YES;
            break;
        case 2://玩咖无聊数据页面
            _posterViews.hidden = YES;
            _oneSimpleViews.hidden = YES;
            _twoSimpleViews.hidden = NO;
            _threeSimpleViews.hidden = YES;
            _fourSimpleViews.hidden = YES;
            break;
        case 3://匹配中的页面
            _posterViews.hidden = YES;
            _oneSimpleViews.hidden = YES;
            _twoSimpleViews.hidden = YES;
            _threeSimpleViews.hidden = NO;
            _fourSimpleViews.hidden = YES;
            break;
        case 4://匹配失败页面
            _posterViews.hidden = YES;
            _oneSimpleViews.hidden = YES;
            _twoSimpleViews.hidden = YES;
            _threeSimpleViews.hidden = YES;
            _fourSimpleViews.hidden = NO;
            break;
        default://默认;游客无聊天数据页面
            _posterViews.hidden = YES;
            _oneSimpleViews.hidden = NO;
            _twoSimpleViews.hidden = YES;
            _threeSimpleViews.hidden = YES;
            _fourSimpleViews.hidden = YES;
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
- (ThreeSimpleView *)threeSimpleViews{
    if (!_threeSimpleViews) {
        _threeSimpleViews = [[ThreeSimpleView alloc]init];
        _threeSimpleViews.hidden = YES;
    }
    return _threeSimpleViews;
}
- (FourSimpleView *)fourSimpleViews{
    if (!_fourSimpleViews) {
        _fourSimpleViews = [[FourSimpleView alloc]init];
        _fourSimpleViews.hidden = YES;
    }
    return _fourSimpleViews;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
