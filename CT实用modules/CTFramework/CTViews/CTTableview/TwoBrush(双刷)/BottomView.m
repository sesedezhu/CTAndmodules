//
//  BottomView.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/8.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "BottomView.h"


@implementation BottomView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor=[UIColor whiteColor];
    
  
    [self addSubview:self.TableView];
   
    
    
    //创建虚拟tableview数据
    NSDictionary *dic1 = @{@"style":@"1"};
    NSDictionary *dic2 = @{@"style":@"0"};
    NSArray *Dataarr = [NSArray arrayWithObjects:dic1,dic2, nil];
    
    NSMutableDictionary *muDic = [[NSMutableDictionary alloc]init];
    [muDic setObject:@"1" forKey:@"tapy"];
    [muDic setObject:Dataarr forKey:@"DataArr"];
    
    _TableView.BrushDataDic = muDic;
}
- (TableViewBrush *)TableView{
    if (!_TableView) {
        _TableView = [[TableViewBrush alloc]initWithFrame:CGRectMake(0, 0, 200, 300) style:UITableViewStylePlain];
    }
    return _TableView;
}
@end
