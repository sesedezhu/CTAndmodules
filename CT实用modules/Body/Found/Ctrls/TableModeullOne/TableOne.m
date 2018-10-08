//
//  TableOne.m
//  CT实用modules
//
//  Created by 涛程 on 2018/10/8.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "TableOne.h"
#import "oneModelCell.h"
#import "twoModelCell.h"
@interface TableOne ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong) UITableView *TableView;
@property (nonatomic ,retain) NSMutableDictionary *DataDic;
@end

@implementation TableOne

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.TableView];
    
    //数据处理
    [self loadFinishingData];
}
#pragma mark - 整理数据
- (void)loadFinishingData{
    //1.制造假数据
    NSString *tapy = @"0";
    if ([tapy isEqualToString:@"0"]) {
        [self loadZeroUI];
    }else{
        [self loadOneUI];
    }
    [_TableView reloadData];
}
- (void)loadZeroUI{
    
    NSDictionary *dic0 = @{@"style":@"0"};
    NSDictionary *dic1 = @{@"style":@"1"};
    NSDictionary *dic2 = @{@"style":@"0"};
    NSDictionary *dic3 = @{@"style":@"1"};
    
    NSArray *Dataarr = [NSArray arrayWithObjects:dic0,dic1,dic2,dic3, nil];
    
    self.DataDic = [[NSMutableDictionary alloc]init];
    [_DataDic setObject:@"0" forKey:@"tapy"];
    [_DataDic setObject:Dataarr forKey:@"DataArr"];
    
}
- (void)loadOneUI{
    NSDictionary *dic0 = @{@"style":@"0"};
    NSDictionary *dic1 = @{@"style":@"0"};
    NSDictionary *dic2 = @{@"style":@"1"};
    NSDictionary *dic3 = @{@"style":@"1"};
    
    NSArray *Dataarr = [NSArray arrayWithObjects:dic0,dic1,dic2,dic3, nil];
    
    self.DataDic = [[NSMutableDictionary alloc]init];
    [_DataDic setObject:@"0" forKey:@"tapy"];
    [_DataDic setObject:Dataarr forKey:@"DataArr"];
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
    NSArray *arr = _DataDic[@"DataArr"];
    NSDictionary *dic = arr[indexPath.row];
    NSString *style = dic[@"style"];
    if ([style isEqualToString:@"0"]) {
        return CONVER_VALUE(93);
    }
    return CONVER_VALUE(61);
}
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//设置每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _DataDic[@"DataArr"];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = _DataDic[@"DataArr"];
    NSDictionary *dic = arr[indexPath.row];
    NSString *style = dic[@"style"];
    UITableViewCell *cell = [self randomTableView:tableView cellForRowStyle:style];
    return cell;
}
- (UITableViewCell *)randomTableView:(UITableView *)tableView cellForRowStyle:(NSString *)style{
    if ([style isEqualToString:@"0"]) {
        static NSString *str = @"twoModelCell";
        twoModelCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[twoModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        return cell;
    }else{
        static NSString *str = @"oneModelCell";
        oneModelCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[oneModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.Lab_left.text = @"昵称";
        [cell.Btn_right setTitle:@"大帅哥-程" forState:UIControlStateNormal];
        [cell loadCellHiddenStyle:NO];
        return cell;
    }
}
//获取选择单元格的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    indexPath.row   行     indexPath.section 组
    
    
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
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _TableView.delegate = self;
        _TableView.dataSource = self;
        //在iOS11上，默认关掉高度的设置，下面三个方法是打开设置的，请根据需求使用
        _TableView.estimatedRowHeight = 0;
        _TableView.estimatedSectionHeaderHeight = 0;
        _TableView.estimatedSectionFooterHeight = 0;
        //去掉cell之间默认虚线
        _TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _TableView.backgroundColor = [UIColor whiteColor];
    }
    return _TableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
