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
    
    
}
- (UITableView *)TableView{
    if (!_TableView) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 300) style:UITableViewStyleGrouped];
    }
    return _TableView;
}
@end
