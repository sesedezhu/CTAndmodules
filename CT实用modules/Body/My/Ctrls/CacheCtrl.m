//
//  CacheCtrl.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/7.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "CacheCtrl.h"
#import "CTCollects.h"
#import "PlistManager.h"
@interface CacheCtrl ()

@end


#define UserPlists @"User.plist"

@implementation CacheCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    __weak typeof(self) weakSelf = self;
    
    //CTCollectSimplify
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1.生成plist",@"2.修改plist",@"3.删除plist", nil];
    CTCollects *collview = [[CTCollects alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [collview CTloadDataArr:arr senderBlock:^(UIButton *sender) {
        [weakSelf ClickBtnCache:sender];
    }];
    [self.view addSubview:collview];
}
- (void)ClickBtnCache:(UIButton *)sender{
    switch (sender.tag-1) {
        case 0:
        {
            //写入本地文件
            [self dateSavePlisets];
        }
            break;
        case 1:
        {
            //修改.plist文件
            [self dateChangePlisets];
        }
            break;
        case 2:
        {
            //删除.plist文件
            [self dateDeletePlisets];
        }
            break;
        default:
            break;
    }
}
//生成本地plist文件
- (void)dateSavePlisets{
    //1、字典存入
    NSDictionary *dic = @{
                          @"sourceId":@(4),
                          @"userId":@(12345),
                          @"linkman":@"程涛"
                          };
    [PlistManager isFilePlistName:UserPlists loadData:dic];
    
    //2、数组存入
    NSArray *arr = [NSArray arrayWithObjects:@"我是程",@"程是谁",@"程是大帅哥", nil];
    [PlistManager isFilePlistName:@"arr.plist" loadData:arr];
}
//修改本地Plisets文件内容
- (void)dateChangePlisets{
    
    NSMutableDictionary *mutaDic = [[NSMutableDictionary alloc]init];
    mutaDic = [PlistManager getFilePlists:UserPlists];
    if (mutaDic != nil) {
        [mutaDic removeObjectForKey:@"linkman"];
        [mutaDic setValue:@"帅哥程66" forKey:@"linkman"];
        [PlistManager isFilePlistName:UserPlists loadData:mutaDic];
        NSLog(@"linkman值修改为====帅哥程66,修改成功");;
    }else{
        NSLog(@"字典为nil，修改失败");
    }
    
}
//删除本地plist文件
- (void)dateDeletePlisets{
    NSString *path = [PlistManager getFilePlistPushName:UserPlists];
    BOOL dataPath = [PlistManager isFileExistWithFilePlistPath:path];
    if (dataPath) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:path error:nil];
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败，路径不存在");
    }
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
