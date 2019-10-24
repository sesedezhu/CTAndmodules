//
//  TableViewBrush.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/23.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "TableViewBrush.h"
#import "TableCellBrush.h"
@implementation TableViewBrush
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        /* 添加子控件的代码*/
        [self loadUI];
    }
    return self;
}

#pragma mark - UI
- (void)loadUI{
    self.delegate = self;
    self.dataSource = self;
}
- (void)setBrushDataDic:(NSDictionary *)BrushDataDic{
    _BrushDataDic = BrushDataDic;
    
    [self reloadData];
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
    NSLog(@"arr.count ============%lu",(unsigned long)arr.count);
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
    if ([style isEqualToString:@"1"]) {
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
