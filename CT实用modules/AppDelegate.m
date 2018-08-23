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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置启动页时间
    [NSThread sleepForTimeInterval:2];
    
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[BaseTaBarViewCtrl alloc] init];
    [self.window makeKeyAndVisible];
    
    
    //三、注册键盘监听
    [self loadIQKey];
    return YES;
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
