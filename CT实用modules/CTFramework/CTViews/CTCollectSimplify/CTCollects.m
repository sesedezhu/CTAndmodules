//
//  CTCollects.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/1.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CTCollects.h"

#define Start_X       CONVER_VALUE(20.0f)           // 第一个按钮的X坐标
#define Start_Y       CONVER_VALUE(10.0f)           // 第一个按钮的Y坐标
#define Width_Space   CONVER_VALUE(18.0f)           // 2个按钮之间的横间距
#define Height_Space  CONVER_VALUE(20.0f)           // 竖间距
#define Button_Height CONVER_VALUE(60.0f)           // 高
#define Button_Width  CONVER_VALUE(100.0f)          // 宽
#define Button_font   CONVER_VALUE(17.0f)           // 字体大小
@implementation CTCollects

- (void)CTloadDataArr:(NSArray *)arr senderBlock:(senderBlock)block{
    for (int i = 0; i < arr.count; i++) {
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height)];
        btn.tag = i+1;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        [btn addTarget:self action:@selector(pushCtrls:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.backgroundColor = [UIColor grayColor];
        btn.titleLabel.font = [UIFont systemFontOfSize: Button_font];
    }
    self.senderBlock = block;
}

- (void)pushCtrls:(UIButton *)sender{
//    NSLog(@"啊！我点击了%ld",sender.tag-1);
    if (_senderBlock) {
        _senderBlock(sender);
    }
}

@end
