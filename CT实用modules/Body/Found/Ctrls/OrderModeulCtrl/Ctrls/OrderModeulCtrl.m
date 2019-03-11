//
//  OrderModeulCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "OrderModeulCtrl.h"
#import "OrderCell001.h"
#import "OrderCell003.h"
#import "OrderCell006.h"
#import "OrderCell007.h"
#import "OrderCell008.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@interface OrderModeulCtrl ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong) UITableView *TableView;
@property (nonatomic ,retain) NSMutableDictionary *sectionDic;
@property(nonatomic ,strong) NSString *OrderTapy;//1为带支付状态架构,其他默认架构
@end

@implementation OrderModeulCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadConfiguration];
    
    
    [self.view addSubview:self.TableView];
    _TableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CONVER_VALUE(30))];
    //架构数据处理
    _OrderTapy = @"0";
    [self loadFinishingDataAndTapy:_OrderTapy];
}
#pragma mark - 本页配置
- (void)loadConfiguration{
    self.navigationItem.title =  @"订单详情";
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
#pragma mark - UITableViewDelegate
//返回头视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
//返回尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
//每组cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((indexPath.section == 0)&&(indexPath.row == [self getNumberOfRowsInSection:indexPath.section])) {
        NSObject *homecell = [[NSObject alloc]init];
        Class currentClass = [OrderCell007 class];
        // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
        //model 为模型实例， keyPath 为cell中 model 的属性名，通过 kvc 统一赋值接口
        return [self.TableView cellHeightForIndexPath:indexPath model:homecell keyPath:@"model" cellClass:currentClass contentViewWidth:[self cellContentViewWith]];
    }
    return [self getCellHeightForRowAtIndexPathRow:indexPath];
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self getNumberOfSections];
}
//设置每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self getNumberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self randomTableView:tableView cellForRowStyle:[self getDataDicStyleAndIndexPathRow:indexPath] cellForRowAtIndexPath:indexPath];
    return cell;
}
- (UITableViewCell *)randomTableView:(UITableView *)tableView cellForRowStyle:(NSString *)style cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger styles = [style integerValue];
    switch (styles) {
        case 1:{
            static NSString *str = @"OrderCell001";
            OrderCell001 *cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell = [[OrderCell001 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
                [cell SetTheCellStyleAtIndexPath:indexPath];//设置cell样式
            }
            return cell;
        }
            break;
        case 3:{
            static NSString *str = @"OrderCell003";
            OrderCell003 *cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell = [[OrderCell003 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
                [cell SetTheCellStyleAtIndexPath:indexPath];//设置cell样式
            }
            return cell;
        }
            break;
        case 6:{
            static NSString *str = @"OrderCell006";
            OrderCell006 *cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell = [[OrderCell006 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
                [cell SetTheCellStyleAtIndexPath:indexPath];//设置cell样式
            }
            return cell;
        }
            break;
        case 7:{
            static NSString *str = @"OrderCell007";
            OrderCell007 *cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell = [[OrderCell007 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
                [cell SetTheCellStyleAtIndexPath:indexPath];//设置cell样式
            }
            return cell;
        }
            break;
        case 8:{
            static NSString *str = @"OrderCell008";
            OrderCell008 *cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (!cell) {
                cell = [[OrderCell008 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
                [cell SetTheCellStyleAtIndexPath:indexPath];//设置cell样式
            }
            return cell;
        }
            break;
        default:
            return [[UITableViewCell alloc]init];
            break;
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
#pragma mark - UITableViewDelegatess架构支持数据封装
//获取cell的高度
- (CGFloat)getCellHeightForRowAtIndexPathRow:(NSIndexPath *)indexPath{
    NSString *style = [self getDataDicStyleAndIndexPathRow:indexPath];
    NSInteger styles = [style integerValue];
    switch (styles) {
        case 1:{
            switch (indexPath.section) {
                case 0:
                {
                    return CONVER_VALUE(57);
                }
                    break;
                case 2:
                {
                    if (indexPath.row == 0) {
                        return CONVER_VALUE(57);
                    }else if ((indexPath.row == [self getNumberOfRowsInSection:indexPath.section]-1)) {
                        return CONVER_VALUE(53);
                    }else{
                        return CONVER_VALUE(33);
                    }
                }
                    break;
                default:
                    return CONVER_VALUE(57);
                    break;
            }
        }
            break;
        case 3:{
            return CONVER_VALUE(50);
        }
            break;
        case 6:{
            return CONVER_VALUE(42);
        }
            break;
        case 7:{
            return CONVER_VALUE(200);
        }
            break;
        case 8:{
            return CONVER_VALUE(50);
        }
            break;
        default:
            return 0.01f;
            break;
    }
}
//获取字典cell中的组数
- (NSInteger)getNumberOfSections{
    NSArray *sectionArr = _sectionDic[@"sectionArr"];
    return sectionArr.count;
}
//获取字典cell中的行数
- (NSInteger)getNumberOfRowsInSection:(NSInteger)section{
    NSArray *sectionArr = _sectionDic[@"sectionArr"];
    NSDictionary *sectionDic = sectionArr[section];
    NSArray *rowArr = sectionDic[@"rowArr"];
    return rowArr.count;
}
//获取字典cell中的样式类型
- (NSString *)getDataDicStyleAndIndexPathRow:(NSIndexPath *)indexPath{
    NSArray *sectionArr = _sectionDic[@"sectionArr"];
    NSDictionary *sectionDic = sectionArr[indexPath.section];
    NSArray *rowArr = sectionDic[@"rowArr"];
    NSDictionary *rowDic = rowArr[indexPath.row];
    NSString *style = rowDic[@"style"];
    return style;
}
#pragma mark - 架构数据处理
- (void)loadFinishingDataAndTapy:(NSString *)tapy{
    //一、制造假数据,tapy为1表示待支付状态;其余默认格式;
    //0
    NSDictionary *rowDic0_0 = @{@"style":@"1"};
    NSDictionary *rowDic0_1 = @{@"style":@"7"};
    NSArray *rowArr0 = [NSArray arrayWithObjects:rowDic0_0,rowDic0_1, nil];
    NSMutableDictionary *sectionDic0 = [[NSMutableDictionary alloc]init];
    [sectionDic0 setObject:rowArr0 forKey:@"rowArr"];
    //1
    NSDictionary *rowDic1_0 = @{@"style":@"3"};
    NSArray *rowArr1 = [NSArray arrayWithObjects:rowDic1_0, nil];
    NSMutableDictionary *sectionDic1 = [[NSMutableDictionary alloc]init];
    [sectionDic1 setObject:rowArr1 forKey:@"rowArr"];
    //2
    NSDictionary *rowDic2_0 = @{@"style":@"1"};
    NSDictionary *rowDic2_1 = @{@"style":@"1"};
    NSDictionary *rowDic2_2 = @{@"style":@"1"};
    NSDictionary *rowDic2_3 = @{@"style":@"1"};
    NSDictionary *rowDic2_4 = @{@"style":@"1"};
    NSDictionary *rowDic2_5 = @{@"style":@"1"};
    NSArray *rowArr2 = [NSArray arrayWithObjects:rowDic2_0,rowDic2_1,rowDic2_2,rowDic2_3,rowDic2_4,rowDic2_5, nil];
    NSMutableDictionary *sectionDic2 = [[NSMutableDictionary alloc]init];
    [sectionDic2 setObject:rowArr2 forKey:@"rowArr"];
    //3
    NSDictionary *rowDic3_0 = @{@"style":@"1"};
    NSDictionary *rowDic3_1 = @{@"style":@"6"};
    NSDictionary *rowDic3_2 = @{@"style":@"6"};
    NSDictionary *rowDic3_3 = @{@"style":@"6"};
    NSArray *rowArr3 = [NSArray arrayWithObjects:rowDic3_0,rowDic3_1,rowDic3_2,rowDic3_3, nil];
    NSMutableDictionary *sectionDic3 = [[NSMutableDictionary alloc]init];
    [sectionDic3 setObject:rowArr3 forKey:@"rowArr"];
    //4
    NSMutableDictionary *sectionDic4 = [[NSMutableDictionary alloc]init];
    if ([tapy isEqualToString:@"0"]){
        NSDictionary *rowDic4_0 = @{@"style":@"6"};
        NSDictionary *rowDic4_1 = @{@"style":@"6"};
        NSDictionary *rowDic4_2 = @{@"style":@"6"};
        NSDictionary *rowDic4_3 = @{@"style":@"6"};
        NSArray *rowArr4 = [NSArray arrayWithObjects:rowDic4_0,rowDic4_1,rowDic4_2,rowDic4_3, nil];
        [sectionDic4 setObject:rowArr4 forKey:@"rowArr"];
    }else{
        NSDictionary *rowDic4_0 = @{@"style":@"6"};
        NSDictionary *rowDic4_1 = @{@"style":@"6"};
        NSArray *rowArr4 = [NSArray arrayWithObjects:rowDic4_0,rowDic4_1, nil];
        [sectionDic4 setObject:rowArr4 forKey:@"rowArr"];
    }
    //5
    NSDictionary *rowDic5_0 = @{@"style":@"8"};
    NSArray *rowArr5 = [NSArray arrayWithObjects:rowDic5_0, nil];
    NSMutableDictionary *sectionDic5 = [[NSMutableDictionary alloc]init];
    [sectionDic5 setObject:rowArr5 forKey:@"rowArr"];
    
    NSArray *sectionArr = [NSArray arrayWithObjects:sectionDic0,sectionDic1,sectionDic2,sectionDic3,sectionDic4,sectionDic5, nil];
    
    self.sectionDic = [[NSMutableDictionary alloc]init];
    [_sectionDic setObject:tapy forKey:@"tapy"];
    [_sectionDic setObject:sectionArr forKey:@"sectionArr"];
    
 
    [_TableView reloadData];
}

#pragma mark - 懒加载
- (UITableView *)TableView{
    if (!_TableView) {
        _TableView = [CTUIManagers CTTableViewBackgroundColor:CTColorGroupTableViewBackground separatorStyle:UITableViewCellSeparatorStyleNone style:UITableViewStyleGrouped Frame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-CTStopNavRect-CTStopStatusRect)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
        
    }
    return _TableView;
}

@end
