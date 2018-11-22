//
//  AppDelegate.m
//  CT实用modules
//
//  Created by 涛程 on 2018/7/23.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTaBarViewCtrl.h"
#import "IQKeyboardManager.h"
#import "GuideCtrl2.h"
#import "LostNetView.h"
@interface AppDelegate ()
@property(nonatomic,strong)LostNetView *lostView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置启动页时间
    [NSThread sleepForTimeInterval:2];
    
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //二、注册网络状态显示
    [self reachabilityChanged];
    //三、注册键盘监听
    [self loadIQKey];
    //四、加载引导页
    [self loadAdvertising];
    return YES;
}
#pragma mark - 网络状态
-(void)showLostView{
    _lostView = [[LostNetView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight)];
    [self.window addSubview:_lostView];
}
-(void)removeLostView{
    [_lostView removeView];
}
- (void)reachabilityChanged{
    
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                if (!_lostView) {
                    
                }else{
                    [self removeLostView];
                }
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                [self showLostView];
                
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                if (!_lostView) {
                    
                }else{
                    [self removeLostView];
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                if (!_lostView) {
                    
                }else{
                    [self removeLostView];
                }
                
                break;
        }
    }];
    // 3.开始监控
    [mgr startMonitoring];
}
#pragma mark - 引导或广告图
- (void)loadAdvertising{
    //保存当前版本
    NSString * currentAppVersion = [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * appVersion = [userDefaults objectForKey:@"appVersion"];
    
    
    //判断当前版本和之前版本，如果为nil或不一样，执行启动图
    if (appVersion == nil || ![appVersion isEqualToString:currentAppVersion]) {
        NSLog(@"启动引导图");
        
        [userDefaults setValue:currentAppVersion forKey:@"appVersion"];
        GuideCtrl2 *guide = [[GuideCtrl2 alloc] init];
        self.window.rootViewController = guide;
        
    }else{
        NSLog(@"广告页");
        //        [userDefaults setValue:nil forKey:@"appVersion"];
        
        self.window.rootViewController = [[BaseTaBarViewCtrl alloc] init];
        // 判断沙盒中是否存在广告图片，如果存在，直接显示
        //        NSString *filePath = [AdImageTool getFilePathWithImageName:[[NSUserDefaults standardUserDefaults] valueForKey:@"adImageName"]];
        //        NSLog(@"filePath122222313-========%@",filePath);
        //        BOOL isExist = [AdImageTool isFileExistWithFilePath:filePath];
        //        if (isExist) {
        //            AdvertiseView *advertiseView = [[AdvertiseView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //            advertiseView.filePath = filePath;
        //            [advertiseView show];
        //        }else{
        //            NSLog(@"启动的时候没有检索到广告图片");
        //        }
    }
}
#pragma mark - 键盘监听
- (void)loadIQKey{
    // 设置键盘监听管理
    //    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    [[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarBySubviews];
    //设置点击背景收回键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;// 控制点击背景是否收起键盘
    
    [IQKeyboardManager sharedManager].enable = YES;// 控制整个功能是否启用
    [IQKeyboardManager sharedManager].toolbarManageBehaviour = IQAutoToolbarBySubviews;// 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;// 控制是否显示键盘上的工具条
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
