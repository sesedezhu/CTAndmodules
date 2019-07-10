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
// 引入 JPush 功能所需头文件
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
@interface AppDelegate ()<JPUSHRegisterDelegate>
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
    //五极光推送注册
    [self loadJGPushMoudleOptions:launchOptions];
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
#pragma mark - 极光推送注册
- (void)loadJGPushMoudleOptions:(NSDictionary *)launchOptions{
    //1、导入JGPush包；
    //2、导入系统支持frameworl
    //3、Capabilities通知开关打开
    //4、设置网络白名单
    //5、代码集成
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义 categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService registerLbsGeofenceDelegate:self withLaunchOptions:launchOptions];
    
    [JPUSHService setupWithOption:launchOptions appKey:@"ba7423262e920f2fa58793ad"
                          channel:@"App Store"
                 apsForProduction:YES
            advertisingIdentifier:nil];
    
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
            
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
}
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService setBadge:0];
}
#pragma mark- JPUSHRegisterDelegate

// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)){
    if (@available(iOS 10.0, *)) {
        if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            //从通知界面直接进入应用
        }else{
            //从通知设置界面进入应用
        }
    } else {
        // Fallback on earlier versions
    }
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request;
    UNNotificationContent *content = request.content;
    NSNumber *badge = content.badge;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSInteger number = [badge integerValue];
        [JPUSHService setBadge:number+1];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    
    //    NSInteger badge = [userInfo[@"aps"][@"badge"] intValue];
    //    [JPUSHService setBadge:badge+1];
    //    NSLog(@"badge ====== %ld",(long)badge);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
    
}










- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
