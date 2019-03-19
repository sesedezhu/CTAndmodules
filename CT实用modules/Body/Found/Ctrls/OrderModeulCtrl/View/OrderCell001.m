//
//  OrderCell001.m
//  CT实用modules
//
//  Created by 涛程 on 2019/3/8.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import "OrderCell001.h"
#import "MZTimerLabel.h"
@interface OrderCell001 ()<MZTimerLabelDelegate>{
    MZTimerLabel *timerExample6;
}
@end
@implementation OrderCell001
/** 初始化方法,自定义 cell时,不清楚高度,可以在这里添加子空间 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadUI];
    }
    return self;
}
- (void)loadUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;//点击不会有选中效果
    
    [self addSubview:self.CellView];
    
    UIView *view = self;
    _CellView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .bottomSpaceToView(view, 0);
    
    [_CellView loadCellHiddenStyle:YES];
}
#pragma mark - 配置cell页面样式
- (void)SetTheCellStyleAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            _CellView.View_line.hidden = NO;
        }
            break;
            
        default:{
            _CellView.View_line.hidden = YES;
        }
            break;
    }
    [self setLabTextFont:indexPath];
    [self setLabTextContents:indexPath];
}
//设置字体大小、默认控件颜色及是否隐藏相关控件
- (void)setLabTextFont:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
            _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
            _CellView.Lab_left.textColor = CTColorGrayaAndBlack;
            [_CellView.Btn_right setTitleColor:CTColorOrange forState:UIControlStateNormal];
            _CellView.Btn_right.hidden = NO;
        }
            break;
        case 2:{
            if (indexPath.row == 0) {
                _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
                _CellView.Lab_left.textColor = CTColorGrayaAndBlack;
                _CellView.Btn_right.hidden = YES;
            }else if (indexPath.row == 5) {
                _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
                _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(15)];
                _CellView.Lab_left.textColor = CTColorLightGraya;
                [_CellView.Btn_right setTitleColor:CTColorOrange forState:UIControlStateNormal];
                _CellView.Btn_right.hidden = NO;
            }else{
                _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
                _CellView.Btn_right.titleLabel.font = [UIFont systemFontOfSize:CONVER_VALUE(13)];
                _CellView.Lab_left.textColor = CTColorLightGraya;
                [_CellView.Btn_right setTitleColor:CTColorLightGraya forState:UIControlStateNormal];
                _CellView.Btn_right.hidden = NO;
            }
        }
            break;
            
        default:{
            _CellView.Lab_left.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
            _CellView.Btn_right.hidden = YES;
        }
            break;
    }
}

//设置系统文案
- (void)setLabTextContents:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
             _CellView.Lab_left.text = @"支付状态";
            [_CellView.Btn_right setTitle:@"xxx" forState:UIControlStateNormal];
            [_CellView.Btn_right addTarget:self action:@selector(ctstr) forControlEvents:UIControlEventTouchUpInside];
            //初始化定时器
            timerExample6 = [[MZTimerLabel alloc] initWithLabel:_CellView.Btn_right.titleLabel andTimerType:MZTimerLabelTypeTimer];
            timerExample6.shouldCountBeyondHHLimit = YES;
            timerExample6.delegate = self;
            break;
        case 2:{
            switch (indexPath.row) {
                case 0:
                    _CellView.Lab_left.text = @"交易明细";
                    break;
                case 1:
                    _CellView.Lab_left.text = @"房费总额";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    break;
                case 2:
                    _CellView.Lab_left.text = @"押金费用";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    break;
                case 3:
                    _CellView.Lab_left.text = @"优惠金额";
                    [_CellView.Btn_right setTitle:@"无折扣" forState:UIControlStateNormal];
                    break;
                case 4:
                    _CellView.Lab_left.text = @"折扣";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    _CellView.View_line.hidden = NO;
                    break;
                default:
                    _CellView.Lab_left.text = @"需付款";
                    [_CellView.Btn_right setTitle:@"¥xx" forState:UIControlStateNormal];
                    break;
            }
        }
            break;
        default:
            _CellView.Lab_left.text = @"入住人信息";
            break;
    }
}
//动态赋值,开始定时器
- (void)ctstr{
    [timerExample6 setCountDownTime:10];
    [timerExample6 reset];
    [timerExample6 start];
}
#pragma MZTimerLabelDelegate
- (void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    NSLog(@"QGMoneyCell->倒计时结束，回调事件：-开抢啦！！伙计们！！");
    //把输入框的值传过去
    if (_ExampleValueBlock) {
        //block调用
        _ExampleValueBlock();
    }
}
- (void)timerLabel:(MZTimerLabel *)timerlabel countingTo:(NSTimeInterval)time timertype:(MZTimerLabelType)timerType{
    
    if([timerlabel isEqual:timerExample6] && time < 10){
        timerlabel.timeLabel.textColor = [UIColor redColor];
    }
    
}
- (NSString*)timerLabel:(MZTimerLabel *)timerLabel customTextToDisplayAtTime:(NSTimeInterval)time
{
    if([timerLabel isEqual:timerExample6]){
        int second = (int)time  % 60;
        int minute = ((int)time / 60) % 60;
        int hours = ((int)time / 3600) % 24;
        int hou  =(int)time / 3600;
        int day = hou/24;
        return [NSString stringWithFormat:@"%02d天%02d时%02d分%02d秒",day,hours,minute,second];
    }else
        return nil;
}
#pragma mark - 懒加载
- (CellView001 *)CellView{
    if (!_CellView) {
        _CellView = [[CellView001 alloc]init];
    }
    return _CellView;
}
- (void)dealloc{
    [timerExample6 removeFromSuperview];
    timerExample6 = nil;
    timerExample6.delegate = nil;
}
@end
