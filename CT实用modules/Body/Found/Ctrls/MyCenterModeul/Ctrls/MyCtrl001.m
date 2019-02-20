//
//  MyCtrl001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/2/20.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "MyCtrl001.h"
#import "MyHeaderView001.h"
@interface MyCtrl001 ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong) UITableView *TableView;
@property(nonatomic ,strong) MyHeaderView001 *headerView;
@end

@implementation MyCtrl001

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    
}
- (void)loadUI{
    [self.view addSubview:self.TableView];
    _TableView.tableHeaderView = self.headerView;
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
//    NSArray *arr = _DataDic[@"DataArr"];
//    NSDictionary *dic = arr[indexPath.row];
//    NSString *style = dic[@"style"];
//    if ([style isEqualToString:@"0"]) {
//        return CONVER_VALUE(93);
//    }
    return CONVER_VALUE(61);
}
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//设置每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSArray *arr = _DataDic[@"DataArr"];
//    return arr.count;
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSArray *arr = _DataDic[@"DataArr"];
//    NSDictionary *dic = arr[indexPath.row];
//    NSString *style = dic[@"style"];
    UITableViewCell *cell = [self randomTableView:tableView cellForRowStyle:@"0"];
    return cell;
}
- (UITableViewCell *)randomTableView:(UITableView *)tableView cellForRowStyle:(NSString *)style{
//    if ([style isEqualToString:@"0"]) {
//        static NSString *str = @"twoModelCell";
//        twoModuleCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
//        if (!cell) {
//            cell = [[twoModuleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
//        }
//        return cell;
//    }else{
//        static NSString *str = @"oneModelCell";
//        oneModuleCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
//        if (!cell) {
//            cell = [[oneModuleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
//        }
//        cell.Lab_left.text = @"昵称";
//        [cell.Btn_right setTitle:@"大帅哥-程" forState:UIControlStateNormal];
//        [cell loadCellHiddenStyle:NO];
//        return cell;
//    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
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
        _TableView = [CTUICtrlsManagers CTTableViewBackgroundColor:[UIColor whiteColor] separatorStyle:UITableViewCellSeparatorStyleNone style:UITableViewStyleGrouped Frame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
        _TableView.backgroundColor = [UIColor yellowColor];
    }
    return _TableView;
}
- (MyHeaderView001*)headerView{
    if (!_headerView) {
        _headerView = [[MyHeaderView001 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CONVER_VALUE(228))];
    }
    return _headerView;
}
@end
