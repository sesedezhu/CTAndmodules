//
//  InstructionScrollView.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/11.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "InstructionScrollView.h"

@implementation InstructionScrollView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    [self addSubview:self.Lab_conter];
    UIScrollView *scview = self;
    _Lab_conter.sd_layout
    .topSpaceToView(scview, 0)
    .leftSpaceToView(scview, 0)
    .rightSpaceToView(scview, 0)
    .autoHeightRatio(0);
    
    
    _Lab_conter.text = @"dsadiasgdas d gasgdgasgd ias dhsahdiosahdi ousagiufisau gdfisgadfiygisudg fi osdgfigaifga is gfiaygfaskhfbajfuyag fas gufy8weg ifgkfi syagfiasg fiagsifguy dfuasgfug fiasg fd agufuaysygf iasgifuydsafuasg diosh aohdosah dosah sbf jeuihdoasfhfiodshfcygefbkbdskcjabs hdias igfiyga fgashfash fashf oashfui gsaiygfi afo asd lsajodias hoiyfhuais yfiusa fusaio fhas hfias hjdpasjd;jdwedh ioashdlajd iwofhyiuoahfjasfhosapfhuanf iuah ashf hasuhfdoa dfaspj fiahs oifhasouhfa ufahs ofhaslfnjksa fasg adf af iosahi osahf oiasfposfgjpogu -g-s gp fas kdsfjg oishfdbfjdsnflahfiuehfasjbfjkdshfoiahfeuhfoais dfashfiueshf˙eoxnhfdbcyf efi eugxn ";
    
    
    //设置scrollView初始显示的位置
    //    scrollView.contentOffset = CGPointMake(150, 200);
    //设置内容的宽高，这个属性决定了scrollView能否滑动
    self.contentSize = CGSizeMake(CONVER_VALUE(250), CONVER_VALUE(290)*3);
    //取消纵向滚动条
    self.showsHorizontalScrollIndicator = NO;
    //取消横向滚动条
//    self.showsVerticalScrollIndicator = YES;
    //内容到边界过后是否有一个反弹效果
    self.bounces = YES;
    //滚动条样式
//    self.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    //锁定水平方向或者垂直方向, 二选一, 方向跟第一次的方向是一样
//    self.directionalLockEnabled = YES;
    //是否允许滚动
    self.scrollEnabled = YES;
    //是否显示分页
    self.pagingEnabled = NO;
    
    
    
}

- (UILabel *)Lab_conter{
    if (!_Lab_conter) {
        _Lab_conter = [[UILabel alloc]init];
        _Lab_conter.numberOfLines = 0;
    }
    return _Lab_conter;
}
@end
