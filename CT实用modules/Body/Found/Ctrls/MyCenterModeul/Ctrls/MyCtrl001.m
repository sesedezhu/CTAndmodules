//
//  MyCtrl001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/20.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "MyCtrl001.h"
#import "MyHeaderView001.h"
#import "ThreeModuleCell.h"
#import "FourModuleCell.h"
#import "CTLoginCtrls2.h"
#import "QL_TelVCViewController.h"
@interface MyCtrl001 ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic ,strong) UITableView *TableView;
@property(nonatomic ,strong) MyHeaderView001 *headerView;
@property (nonatomic ,retain) NSMutableDictionary *DataDic;
@end

@implementation MyCtrl001
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self loadFinishingData];
}
#pragma mark - loadUI
- (void)loadUI{
    [self.view addSubview:self.TableView];
    _TableView.tableHeaderView = self.headerView;
}
#pragma mark - 点击事件
- (void)isPushLoginCtrls{
    CTLoginCtrls2 *login = [[CTLoginCtrls2 alloc]init];
    [login setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:login animated:YES];
}
#pragma mark - 整理数据
- (void)loadFinishingData{
    //1.制造假数据
    NSString *tapy = @"1";
    if ([tapy isEqualToString:@"0"]) {
        [self loadZeroUI];
    }else{
        [self loadOneUI];
    }
    [_TableView reloadData];
}
#define ThreeModuleCellStyle      @"ThreeModuleCell"
#define FourModuleCellStyle       @"FourModuleCell"
- (void)loadZeroUI{
    
    NSDictionary *dic0 = @{@"style":ThreeModuleCellStyle};
    NSArray *Dataarr = [NSArray arrayWithObjects:dic0, nil];
    
    self.DataDic = [[NSMutableDictionary alloc]init];
    [_DataDic setObject:@"0" forKey:@"tapy"];
    [_DataDic setObject:Dataarr forKey:@"DataArr"];
    
}
- (void)loadOneUI{
    NSDictionary *dic0 = @{@"style":ThreeModuleCellStyle};
    NSDictionary *dic1 = @{@"style":FourModuleCellStyle};
    NSArray *Dataarr = [NSArray arrayWithObjects:dic0,dic1, nil];
    
    self.DataDic = [[NSMutableDictionary alloc]init];
    [_DataDic setObject:@"1" forKey:@"tapy"];
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
    NSArray *arr = _DataDic[@"DataArr"];
    if ((arr.count>1) && (section == (arr.count-1))) {
        return CONVER_VALUE(249);
    }
    return 0.01f;
}
//返回尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
//每组cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self getDataDicStyleAndIndexPath:indexPath] isEqualToString:ThreeModuleCellStyle]) {
        return CONVER_VALUE(53);
    }
    return CONVER_VALUE(50);
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
        static NSString *str = @"ThreeModuleCell";
        ThreeModuleCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[ThreeModuleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        return cell;
    }else if ([style isEqualToString:FourModuleCellStyle]){
        static NSString *str = @"FourModuleCell";
        FourModuleCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[FourModuleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            cell.Btn.userInteractionEnabled = NO;
        }
        return cell;
    }else{
        return [[UITableViewCell alloc]init];
    }
}
//获取选择单元格的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    indexPath.row   行     indexPath.section 组
    NSString *style = [self getDataDicStyleAndIndexPath:indexPath];
    if ([style isEqualToString:ThreeModuleCellStyle]){
        QL_TelVCViewController  *telVC = [[QL_TelVCViewController alloc] init];
        [telVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:telVC animated:YES];
    }else if ([style isEqualToString:FourModuleCellStyle]){
        NSLog(@"FourModuleCell");
    }
    
}
//设置cell中分割线的位置
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    cell.separatorInset = UIEdgeInsetsMake(0, CONVER_VALUE(23), 0, CONVER_VALUE(30));
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    //缩进50pt
}
#pragma mark - 懒加载
- (UITableView *)TableView{
    if (!_TableView) {
        _TableView = [CTUIManagers CTTableViewBackgroundColor:[UIColor whiteColor] separatorStyle:UITableViewCellSeparatorStyleNone style:UITableViewStyleGrouped Frame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
        
    }
    return _TableView;
}
- (MyHeaderView001*)headerView{
    if (!_headerView) {
        _headerView = [[MyHeaderView001 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CONVER_VALUE(228))];
        [_headerView.LoginBtn addTarget:self action:@selector(isPushLoginCtrls) forControlEvents:UIControlEventTouchUpInside];
        UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isPushLoginCtrls)];
        [doubletap setNumberOfTapsRequired:1];
        doubletap.delegate = self;
        [_headerView.UserImage addGestureRecognizer:doubletap];
    }
    return _headerView;
}
@end
