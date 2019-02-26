//
//  QL_TelVCViewController.m
//  我度假酒店
//
//  Created by Mac on 2019/1/28.
//  Copyright © 2019年 Mac_WF. All rights reserved.
//

#import "QL_TelVCViewController.h"

@interface QL_TelVCViewController ()
{
    NSMutableArray *telArray;
}
@end

@implementation QL_TelVCViewController
#define WFColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define UIS_WIGHT [[UIScreen mainScreen] bounds].size.width
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = WFColor(239, 239, 244);
 telArray = [NSMutableArray arrayWithObjects:@"0898-65818709",@"0898-66590146", nil];
//创建子视图
    [self _telViews:telArray];
    


}

- (void)_telViews:(NSMutableArray *)telAray{
    
    
    
    UILabel *titLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    titLabel.textColor = WFColor(51, 51, 51);
    titLabel.font = [UIFont systemFontOfSize:18];
    
    titLabel.text = @"联系我们";
        
  
    titLabel.tag = 4;
    titLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titLabel;
    
    
    UIButton *backBut = [UIButton buttonWithType:UIButtonTypeCustom];
    backBut.frame = CGRectMake(0, 0,30, 25);
    [backBut setTitle:@"  " forState:UIControlStateNormal];
    [backBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBut setImage:[UIImage imageNamed:@"MyBkB002"] forState:UIControlStateNormal];
    backBut.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [backBut addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemBut = [[UIBarButtonItem alloc] initWithCustomView:backBut];
    self.navigationItem.leftBarButtonItem = itemBut;
    
    
    
    
     NSMutableArray *telImageArray = [NSMutableArray arrayWithObjects:@"MyPhone002",@"MyKey002", nil];
    
    NSMutableArray *telTitleArray = [NSMutableArray arrayWithObjects:@"全国订房热线",@"房屋托管热线", nil];
   
    for (int indexs = 0; indexs<telAray.count; indexs++) {
        
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = WFColor(255, 255, 255);
        //关键语句
        backView.layer.cornerRadius = 5.0;//2.0是圆角的弧度，根据需求自己更改
        //设置为遮罩，除非view有阴影，否则都要指定为YES的
        backView.layer.masksToBounds = YES;
        backView.layer.borderColor = WFColor(239, 239, 244).CGColor;//设置边框颜色
        backView.layer.borderWidth = 1.0f;//设置边框颜色
        
        
        if (KIsiPhoneX) {
           backView.frame = CGRectMake(15, 88+(25+(indexs*(100+25))), UIS_WIGHT-30, 100);
        }else{
            
          backView.frame = CGRectMake(15, 64+(25+(indexs*(100+25))), UIS_WIGHT-30, 100);
        }
        
        
        //电话图标
        UIImageView  *telImageView = [[UIImageView alloc]init];
        
        telImageView.frame = CGRectMake(18, 40, 18, 18);
        //telImageView.backgroundColor = WFRandomColor;
        telImageView.image = [UIImage imageNamed:telImageArray[indexs]];
        
        [backView addSubview:telImageView];
        
        //全国订房热线
        UILabel *topLabel = [[UILabel alloc] init];
         topLabel.frame = CGRectMake(50, 30, 100, 15);
        topLabel.text = telTitleArray[indexs];
        //topLabel.backgroundColor = WFRandomColor;
        topLabel.textColor = WFColor(51, 51, 51);
        topLabel.font = [UIFont systemFontOfSize:15];
        [backView addSubview:topLabel];
        
        
        
        //num
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.frame = CGRectMake(50, 53, 140, 15);
        numLabel.text = telAray[indexs];
        //numLabel.backgroundColor = WFRandomColor;
        numLabel.textColor = WFColor(241, 96, 39);
        numLabel.font = [UIFont fontWithName:@"Adobe Heiti Std R" size:16];
        [backView addSubview:numLabel];
        
        
        
        //拨打电话按钮
        
        UIButton *telButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [telButton setTitle:@"立 即 拨 打" forState:UIControlStateNormal];
        [telButton setTitleColor:WFColor(241, 96, 39) forState:UIControlStateNormal];
        telButton.frame = CGRectMake(UIS_WIGHT-45-85, 33, 85, 35);
        telButton.backgroundColor = WFColor(255, 255, 255);
        telButton.titleLabel.font = [UIFont systemFontOfSize:14];
        telButton.tag = indexs+1;
        //关键语句
        telButton.layer.cornerRadius = 5.0;//2.0是圆角的弧度，根据需求自己更改
        //设置为遮罩，除非view有阴影，否则都要指定为YES的
        //telButton.layer.masksToBounds = YES;
        telButton.layer.borderColor = WFColor(241, 96, 39).CGColor;//设置边框颜色
        telButton.layer.borderWidth = 1.0f;//设置边框颜色
        [telButton addTarget:self action:@selector(telButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:telButton];
        
        [self.view addSubview:backView];
        
        
        
        
        
        
    }
    
    
    
    
    
}

- (void)telButtonClick:(UIButton *)but{
    
   NSString *telSTr = telArray[but.tag-1];
    
    NSString *string = [NSString stringWithFormat:@"tel:%@",telSTr];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    
}

- (void)backClick{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
