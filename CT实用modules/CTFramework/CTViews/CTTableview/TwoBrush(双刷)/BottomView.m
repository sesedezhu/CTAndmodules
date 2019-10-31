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
    
  
    [self addSubview:self.TableLeft];
    [self addSubview:self.TableRight];
    
    
    //创建虚拟tableview数据
    NSDictionary *dic1 = @{@"style":@"0",@"cont":@"xxx"};
    NSDictionary *dic2 = @{@"style":@"0",@"cont":@"xxx"};
    NSArray *Dataarr = [NSArray arrayWithObjects:dic1,dic2, nil];
    
    NSMutableDictionary *muDic = [[NSMutableDictionary alloc]init];
    [muDic setObject:@"1" forKey:@"tapy"];
    [muDic setObject:Dataarr forKey:@"DataArr"];
    
    _TableLeft.BrushDataDic = muDic;
    _TableRight.BrushDataDic = muDic;
    
    __weak typeof(self) weakSelf = self;
    _TableLeft.TableViewBrushSelectRowAtIndexPathBlock = ^(NSIndexPath * _Nonnull indexPath, NSString * _Nonnull content) {
        NSLog(@"左--------%ld,%@",(long)indexPath.row,content);
        [weakSelf addBottomViewTableLeft:indexPath City:content];
    };
    _TableRight.TableViewBrushSelectRowAtIndexPathBlock = ^(NSIndexPath * _Nonnull indexPath, NSString * _Nonnull content) {
        NSLog(@"右--------%ld,%@",(long)indexPath.row,content);
        [weakSelf addBottomViewTableRight:indexPath City:content];
    };
 }
- (void)addBottomViewTableLeft:(NSIndexPath *)indexPath City:(NSString *)content{
    if (self.BottomViewTableLeftBlock) {
        _BottomViewTableLeftBlock(indexPath,content);
    }
}
- (void)addBottomViewTableRight:(NSIndexPath *)indexPath City:(NSString *)content{
    if (self.BottomViewTableRightBlock) {
        _BottomViewTableRightBlock(indexPath,content);
    }
}
- (TableViewBrush *)TableLeft{
    if (!_TableLeft) {
        _TableLeft = [[TableViewBrush alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/3, kScreenHeight-100-CTStopStatusRect-CTStopNavRect) style:UITableViewStylePlain];
    }
    return _TableLeft;
}
- (TableViewBrush *)TableRight{
    if (!_TableRight) {
        _TableRight = [[TableViewBrush alloc]initWithFrame:CGRectMake(kScreenWidth/3, 0, kScreenWidth-kScreenWidth/3, kScreenHeight-100-CTStopStatusRect-CTStopNavRect) style:UITableViewStylePlain];
    }
    return _TableRight;
}
@end
