//
//  InstructionView.m
//  CT实用modules
//
//  Created by xihasezhu on 2019/10/11.
//  Copyright © 2019 涛程. All rights reserved.
//

#import "InstructionView.h"
#import "CTShowsManager.h"
#import "InstructionScrollView.h"
#import "ToolWebview01.h"
@interface InstructionView ()
@property(nonatomic ,strong) UIButton *BtnIma_Instruction;       //须知按钮
@property(nonatomic ,strong) UIButton *Btn_Instruction;       //须知按钮
@end
@implementation InstructionView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /* 添加子控件的代码*/
        [self loadUI];
        
    }
    return self;
}
#pragma mark - UI
- (void)loadUI{
    self.backgroundColor=[UIColor clearColor];
    
    [self addSubview:self.BtnIma_Instruction];
    [self addSubview:self.Btn_Instruction];
    UIView *view = self;
    _BtnIma_Instruction.sd_layout
    .topSpaceToView(view, 2)
    .leftSpaceToView(view, 2)
    .widthIs(46)
    .heightIs(46);
    
    _Btn_Instruction.sd_layout
    .topSpaceToView(view, 2)
    .leftSpaceToView(_BtnIma_Instruction, 2)
    .rightSpaceToView(view, 2)
    .bottomSpaceToView(view, 2);
    
}
//勾选按钮事件
- (void)ClickInstructionBtns{
    if (_BtnIma_Instruction.selected) {
        _BtnIma_Instruction.selected = NO;
    }else{
        _BtnIma_Instruction.selected = YES;
    }
}
//须知详情按钮
- (void)ClickInstructionBtnImages{
//    InstructionScrollView *view = [[InstructionScrollView alloc]init];
//    view.backgroundColor = [UIColor orangeColor];
//
    
    ToolWebview01 *view= [[ToolWebview01 alloc]init];
    view.backgroundColor = [UIColor whiteColor];
//
    [CTShowsManager CTloadInitContViewTop:CONVER_VALUE(100) Left:(kScreenWidth - CONVER_VALUE(250))/2 Width:CONVER_VALUE(250) Height:CONVER_VALUE(430) addView:view animationTepy:NLWMobileAndReturnBottom transparency:YES interaction:YES time:1.0];
    
    
}
#pragma mark - 懒加载
- (UIButton *)BtnIma_Instruction{
    if (!_BtnIma_Instruction) {
        _BtnIma_Instruction = [CTUIManagers createButtonNormalText:nil normalTextColor:nil font:nil backgroundColor:nil];
        [_BtnIma_Instruction addTarget:self action:@selector(ClickInstructionBtns) forControlEvents:UIControlEventTouchUpInside];
        _BtnIma_Instruction.selected = NO;
        [_BtnIma_Instruction setImage:[UIImage imageNamed:@"TickNormal@2x"] forState:UIControlStateNormal];
        [_BtnIma_Instruction setImage:[UIImage imageNamed:@"TickSelected@2x"] forState:UIControlStateSelected];
    }
    return _BtnIma_Instruction;
}
- (UIButton *)Btn_Instruction{
    if (!_Btn_Instruction) {
        _Btn_Instruction = [CTUIManagers createButtonNormalText:@"用户须知" normalTextColor:[UIColor blueColor] font:nil backgroundColor:[UIColor clearColor]];
        _Btn_Instruction.titleLabel.adjustsFontSizeToFitWidth = YES;
        _Btn_Instruction.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//按钮中lab的左右距离
        _Btn_Instruction.titleLabel.textAlignment = NSTextAlignmentLeft;   //按钮中labk里文字的左右距离
        [_Btn_Instruction addTarget:self action:@selector(ClickInstructionBtnImages) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Btn_Instruction;
}
@end
