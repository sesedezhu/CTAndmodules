//
//  TextCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/10/11.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "TextCtrl.h"
#import "CTCollects.h"
@interface TextCtrl ()
@property(nonatomic ,strong) UITextView *textView;
@property(nonatomic ,strong) UILabel *selecLab;
@end

@implementation TextCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(CONVER_VALUE(50),CONVER_VALUE(50) , CONVER_VALUE(275), CONVER_VALUE(50))];
    _textView.font = [UIFont systemFontOfSize:CONVER_VALUE(19)];
    [self.view addSubview:_textView];
    
    __weak typeof(self) weakSelf = self;
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1.文字宽度",@"2.文字高度",@"3.改变字号",@"4.改变字色",@"5.是否全数字",@"6.去空格处理", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:CGRectMake(0, CONVER_VALUE(120), kScreenWidth, CONVER_VALUE(200))];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtnText:sender];
    }];
    [self.view addSubview:collview];
    
    _selecLab = [[UILabel alloc]initWithFrame:CGRectMake(CONVER_VALUE(50),CONVER_VALUE(350) , CONVER_VALUE(275), CONVER_VALUE(50))];
    [self.view addSubview:_selecLab];
}
- (void)ClickBtnText:(UIButton *)sender{
    switch (sender.tag-1) {
        case 0:
        {
            _selecLab.text =[NSString stringWithFormat:@"文字宽度 == %f",[CTTextTool CTFreeWithWidth:CONVER_VALUE(50) font:CONVER_VALUE(19) str:_textView.text]];
        }
            break;
        case 1:
        {
            _selecLab.text =[NSString stringWithFormat:@"文字高度 == %f",[CTTextTool getContactHeight:CONVER_VALUE(275) font:CONVER_VALUE(19) str:_textView.text]];//不够精细
        }
            break;
        case 2:
        {
            _selecLab.attributedText = [CTTextTool CTFreeRangeAndMakeRangeStart:0 MakeRangeEnd:1 font:CONVER_VALUE(12) str:_textView.text];
        }
            break;
        case 3:
        {
            _selecLab.text = _textView.text;
            [CTTextTool fuwenbenLabel:_selecLab FontNumber:CONVER_VALUE(19) AndRange:NSMakeRange(0, 1) AndColor:[UIColor redColor]];
        }
            break;
        case 4:
        {
            _selecLab.text =[NSString stringWithFormat:@"%@",[CTTextTool deptNumInputShouldNumber:_textView.text]?@"是全数字":@"不是全数字"];
        }
            break;
        case 5:
        {
            _selecLab.text = [CTTextTool CTRemoveStrEmpty:_textView.text];
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
