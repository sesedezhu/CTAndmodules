//
//  GuideCtrl2.m
//  HaiBa
//
//  Created by 涛程 on 2017/7/11.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "GuideCtrl2.h"
#import "SDCycleScrollView.h"
#import "BaseTaBarViewCtrl.h"
#import <sys/utsname.h>
//#import <BaiduMapAPI_Location/BMKLocationComponent.h>     //百度定位
@interface GuideCtrl2 ()<SDCycleScrollViewDelegate
//BMKLocationServiceDelegate
>
{
//    BMKLocationService* _locServices;
    NSString * _Latitude;
    NSString * _longitude;
}
@property(nonatomic ,strong) UITextField *Text_Call;
@property(nonatomic ,strong) UIButton *btn;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView6;

@end

@implementation GuideCtrl2
- (NSString*)deviceVersion
{
    
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //  只判断 ipad
    if ([deviceString containsString:@"iPad"])      return @"iPad";
    
    
    
    return @"UnKnown";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //7、初始化BMKLocationService
//    _locServices = [[BMKLocationService alloc]init];
//    //启动LocationService
//    _locServices.delegate = self;  //定位代理
//    [_locServices startUserLocationService];
    // 情景一：采用本地图片实现
    NSArray *imageNames = @[@"LandingPage_bg1",
                            @"LandingPage_bg2",
                            @"LandingPage_bg3",
                            @"LandingPage_bg4"
                            // 本地图片请填写全名
                            ];
    self.cycleScrollView6.localizationImageNamesGroup =imageNames;
    
    [self.view addSubview:_cycleScrollView6];
    //控制图片适配
    if ([UIScreen mainScreen].bounds.size.height == 736.0) {
        _cycleScrollView6.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }else{
        _cycleScrollView6.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    }
    
    
    
    [self.view addSubview:self.Text_Call];
    [self.view addSubview:self.btn];
}
- (void)loadhome{
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
//        NSUserDefaults *sud = [NSUserDefaults standardUserDefaults];
//        [sud setObject:_Text_Call.text forKey:TJRID];
//        [sud setObject:_longitude forKey:Homelongitude];
//        [sud setObject:_Latitude forKey:Homelatitude];
//        [sud synchronize];
        
        //关闭LocationService
//        [_locServices stopUserLocationService];
//        _locServices.delegate = nil;  //定位代理
        
        
    });
    
    //    });
    
    BaseTaBarViewCtrl *root = [[BaseTaBarViewCtrl alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = root;
}
#pragma mark - 定位代理
//实现相关delegate 处理位置信息更新
////处理方向变更信息
//- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
//{
//    //        NSLog(@"heading is %@",userLocation.heading);
//}
////处理位置坐标更新
//- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
//{
//    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//
//    double endlongitude = userLocation.location.coordinate.longitude;
//    double endLatitude = userLocation.location.coordinate.latitude;
//    _Latitude = [NSString stringWithFormat:@"%f",endLatitude];
//    _longitude = [NSString stringWithFormat:@"%f",endlongitude];
//
//}
//- (void)didFailToLocateUserWithError:(NSError *)error{
//
//}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
    if (index == 3) {
        NSString *ipad = [self deviceVersion];
        if ([ipad isEqualToString:@"iPad"]) {
            [UIView animateWithDuration:0.3 animations:^{
                
                _Text_Call.frame = CGRectMake(TRANS_VALUE(50), TRANS_VALUE(220), TRANS_VALUE(210), TRANS_VALUE(30));
                _btn.frame = CGRectMake(TRANS_VALUE(50), TRANS_VALUE(262), TRANS_VALUE(210), TRANS_VALUE(30));
                
            }];
        }else{
            
            float hCall = TRANS_VALUE(440);
            float hbtn = TRANS_VALUE(482);
            if (BoolIponX) {
                hCall = TRANS_VALUE(440)+TRANS_VALUE(81);
                hbtn = TRANS_VALUE(482)+TRANS_VALUE(81);
            }
            
            [UIView animateWithDuration:0.3 animations:^{
                
                _Text_Call.frame = CGRectMake(TRANS_VALUE(50), hCall, TRANS_VALUE(210), TRANS_VALUE(30));
                _btn.frame = CGRectMake(TRANS_VALUE(50), hbtn, TRANS_VALUE(210), TRANS_VALUE(30));
                
            }];
            
        }
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _Text_Call.frame = CGRectMake(TRANS_VALUE(50), TRANS_VALUE(1000), TRANS_VALUE(210), TRANS_VALUE(30));
            _btn.frame = CGRectMake(TRANS_VALUE(50), TRANS_VALUE(1000), TRANS_VALUE(210), TRANS_VALUE(30));
            
        }];
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    _cycleScrollView6.delegate = nil;
    [_cycleScrollView6 removeFromSuperview];
//    if (_locServices !=nil) {
//        _locServices = nil;
//    }
}

- (SDCycleScrollView *)cycleScrollView6{
    if (!_cycleScrollView6) {
        
        
        _cycleScrollView6 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) delegate:self placeholderImage:nil];//默认背景图
        _cycleScrollView6.autoScroll = NO;
        _cycleScrollView6.infiniteLoop = NO;
        _cycleScrollView6.showPageControl = YES;
        _cycleScrollView6.delegate = self;
        _cycleScrollView6.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _cycleScrollView6.pageControlBottomOffset = TRANS_VALUE(20);
        
        _cycleScrollView6.currentPageDotImage = [UIImage imageNamed:@"yuandiansele"];
        _cycleScrollView6.pageDotImage = [UIImage imageNamed:@"yuandian"];
        
        //图片向右或者向下滚动
        _cycleScrollView6.scrollDirection =
        UICollectionViewScrollDirectionHorizontal;
        if (BoolIponX) {
            _cycleScrollView6.pageControlBottomOffset = TRANS_VALUE(37);
        }
        
    }
    return _cycleScrollView6;
}
- (UITextField *)Text_Call{
    if (!_Text_Call) {
        _Text_Call = [[UITextField alloc]initWithFrame:CGRectMake(TRANS_VALUE(50), TRANS_VALUE(1000), TRANS_VALUE(210), TRANS_VALUE(30))];
        _Text_Call.layer.cornerRadius = TRANS_VALUE(12.5f);
        _Text_Call.clipsToBounds = YES;
        _Text_Call.placeholder = @"推荐人手机号码(可不填)";
        _Text_Call.keyboardType = UIKeyboardTypeNumberPad;
        _Text_Call.backgroundColor = CTColorWhite;
        _Text_Call.textAlignment = NSTextAlignmentCenter;
        //        _Text_Call.backgroundColor = [UIColor  yellowColor];
        [_Text_Call.layer setBorderColor:allcolorAlphasCT(240, 240, 240, 1.0).CGColor];
        [_Text_Call.layer setBorderWidth:1];
    }
    return _Text_Call;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(TRANS_VALUE(50), TRANS_VALUE(1000), TRANS_VALUE(210), TRANS_VALUE(30))];
        _btn.backgroundColor = allcolorAlphasCT(240, 240, 240, 1.0);
        _btn.layer.cornerRadius = TRANS_VALUE(12.5f);
        _btn.clipsToBounds = YES;
        [_btn addTarget:self action:@selector(loadhome) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitle:@"立即体验" forState:UIControlStateNormal];
    }
    return _btn;
}

@end
