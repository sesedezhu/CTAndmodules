//
//  PayCtrl001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/27.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "PayCtrl001.h"
#import "PayResultsCtrl001.h"
#import "HeaderView002.h"
#import "PayNRCell001.h"
#import "PayStyleCell001.h"
#import "CellView004.h"
@interface PayCtrl001 ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong) UITableView *TableView;
@property (nonatomic ,retain) NSMutableDictionary *DataDic;
@property(nonatomic ,strong) HeaderView002 *headerView;
@property(nonatomic ,strong) CellView004 *footerView;
@end

@implementation PayCtrl001
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self loadConfiguration];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadFinishingData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
#pragma mark - 本页配置
- (void)loadConfiguration{
    self.navigationItem.title =  @"确认付款";
    UIButton *backBut = [UIButton buttonWithType:UIButtonTypeCustom];
    backBut.frame = CGRectMake(0, 0,30, 25);
    [backBut setTitle:@"  " forState:UIControlStateNormal];
    [backBut setTitleColor:CTColorBlack forState:UIControlStateNormal];
    [backBut setImage:[UIImage imageNamed:@"MyBkB002"] forState:UIControlStateNormal];
    backBut.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [backBut addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemBut = [[UIBarButtonItem alloc] initWithCustomView:backBut];
    self.navigationItem.leftBarButtonItem = itemBut;

}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - loadUI
- (void)loadUI{
    self.view.backgroundColor = CTColorGroupTableViewBackground;
    [self.view addSubview:self.TableView];
    _TableView.tableHeaderView = self.headerView;
    _TableView.tableFooterView = self.footerView;
}
#pragma mark - 整理数据
- (void)loadFinishingData{
    
    [self loadZeroUI];
    
    [_TableView reloadData];
}
#define ThreeModuleCellStyle      @"PayNRCell001"
#define FourModuleCellStyle       @"PayStyleCell001"
- (void)loadZeroUI{
    
    NSDictionary *dic0 = @{@"style":ThreeModuleCellStyle};  //row
    NSDictionary *dic1 = @{@"style":ThreeModuleCellStyle};  //row
    NSDictionary *dic2 = @{@"style":FourModuleCellStyle};  //row
    NSArray *Dataarr = [NSArray arrayWithObjects:dic0,dic1,dic2, nil];
    
    self.DataDic = [[NSMutableDictionary alloc]init];
    [_DataDic setObject:@"0" forKey:@"tapy"];               //section
    [_DataDic setObject:Dataarr forKey:@"DataArr"];
    
}
//获取字典中的样式类型
- (NSString *)getDataDicStyleAndIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = _DataDic[@"DataArr"];
    NSDictionary *dic = arr[indexPath.section];
    NSString *style = dic[@"style"];
    return style;
}
#pragma mark - UITableViewDelegate
//返回头视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
//返回尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
//每组cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CONVER_VALUE(61);
}
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray *arr = _DataDic[@"DataArr"];
    return arr.count;
}
//设置每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self randomTableView:tableView cellForRowStyle:[self getDataDicStyleAndIndexPath:indexPath]];
    return cell;
}
- (UITableViewCell *)randomTableView:(UITableView *)tableView cellForRowStyle:(NSString *)style{
    if ([style isEqualToString:ThreeModuleCellStyle]) {
        static NSString *str = ThreeModuleCellStyle;
        PayNRCell001 *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[PayNRCell001 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            [cell.CellView loadCellHiddenStyle:YES];
            [cell updatePayNRCell001UI];
        }
        return cell;
    }else if ([style isEqualToString:FourModuleCellStyle]){
        static NSString *str = FourModuleCellStyle;
        PayStyleCell001 *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[PayStyleCell001 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        return cell;
    }else{
        return [[UITableViewCell alloc]init];
    }
}
//获取选择单元格的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
}
//设置cell中分割线的位置
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    cell.separatorInset = UIEdgeInsetsMake(0, CONVER_VALUE(23), 0, CONVER_VALUE(30));
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    //缩进50pt
}
#pragma mark - 点击支付
- (void)PayBtnClickEvent{
    PayResultsCtrl001 *suc = [[PayResultsCtrl001 alloc]init];
    [self.navigationController pushViewController:suc animated:YES];

}
#pragma mark - 懒加载
- (UITableView *)TableView{
    if (!_TableView) {
        _TableView = [CTUIManagers CTTableViewBackgroundColor:CTColorWhite separatorStyle:UITableViewCellSeparatorStyleNone style:UITableViewStyleGrouped Frame:CGRectMake(0, 10, kScreenWidth, kScreenHeight)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
        _TableView.backgroundColor = CTColorGroupTableViewBackground;
        _TableView.scrollEnabled = NO;
    }
    return _TableView;
}
- (HeaderView002 *)headerView{
    if (!_headerView) {
        _headerView = [[HeaderView002 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CONVER_VALUE(114))];
    }
    return _headerView;
}
- (CellView004 *)footerView{
    if (!_footerView) {
        _footerView = [[CellView004 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CONVER_VALUE(94))];
        _footerView.backgroundColor = CTColorWhite;
        _footerView.Btn.backgroundColor =allcolorAlphasCT(241, 96, 39, 10);
        [_footerView.Btn setTitle:@"立即付款" forState:UIControlStateNormal];
        [_footerView.Btn setTitleColor:CTColorWhite forState:UIControlStateNormal];
        [_footerView updateUIFrameTop:CONVER_VALUE(14) Left:CONVER_VALUE(15) Width:CONVER_VALUE(346) Height:CONVER_VALUE(50)];
        [_footerView.Btn addTarget:self action:@selector(PayBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerView;
}
@end
