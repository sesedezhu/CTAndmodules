//
//  CellModeuls.m
//  CT实用modules
//
//  Created by 涛程 on 2018/9/28.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CellModeuls.h"
#import "oneModelCell.h"
@interface CellModeuls ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong) UITableView *TableView;
@end

@implementation CellModeuls

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"cell模型展示";
    [self.view addSubview:self.TableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    return 1;
}
//设置每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"oneModelCell";
    oneModelCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[oneModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    switch (indexPath.row) {
        case 0:
            cell.Lab_left.text = @"昵称";
            [cell.Btn_right setTitle:@"大帅哥-程" forState:UIControlStateNormal];
            [cell loadCellHiddenStyle:NO];
            break;
        case 1:
            cell.Lab_left.text = @"手机号";
            [cell.Btn_right setTitle:@"18789281990" forState:UIControlStateNormal];
            [cell loadCellHiddenStyle:YES];
            break;
        case 2:
            cell.Lab_left.text = @"个人资料";
            [cell.Btn_right setTitle:nil forState:UIControlStateNormal];
            [cell loadCellHiddenStyle:NO];
            break;
            
        default:
            break;
    }
    
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

@end
