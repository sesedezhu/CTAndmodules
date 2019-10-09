//
//  TableBrush.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/9.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "TableBrush.h"
#import "TableCellBrush.h"
@interface TableBrush ()

@end

@implementation TableBrush

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在iOS11上，默认关掉高度的设置，下面三个方法是打开设置的，请根据需求使用
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    //去掉cell之间默认虚线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = CTColorOrange;
}

#pragma mark - Table view data source

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
    NSArray *arr = _BrushDataDic[@"DataArr"];
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
    NSArray *arr = _BrushDataDic[@"DataArr"];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = _BrushDataDic[@"DataArr"];
    NSDictionary *dic = arr[indexPath.row];
    NSString *style = dic[@"style"];
    UITableViewCell *cell = [self randomTableView:tableView cellForRowStyle:style];
    return cell;
}
- (UITableViewCell *)randomTableView:(UITableView *)tableView cellForRowStyle:(NSString *)style{
    if ([style isEqualToString:@"0"]) {
        static NSString *str = @"TableCellBrush";
        TableCellBrush *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[TableCellBrush alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        return cell;
    }else{
        static NSString *str = @"TableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
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

@end
