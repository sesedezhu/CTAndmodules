//
//  HGViewController.m
//  商报彩票
//
//  Created by 涛程 on 16/12/2.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import "HBViewController.h"
#import "SDAutoLayout.h"
//画规背景颜色
#define backgrodColor [UIColor whiteColor]
/*--屏幕的宽高----*/
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//以640为设计稿
#define TRANS_VALUE(x) ceil(kScreenWidth * x / 320)
//以750为设计稿
#define CONVER_VALUE(x) ceil(kScreenWidth * x / 375)
//写死状态栏高度
#define CTStopStatusRect  (kScreenHeight== 812.0 ? 44 : 20)
//写死导航栏高度
#define CTStopNavRect     (kScreenHeight== 812.0 ? 44 : 44)
@interface HBViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIScrollView *sc;
@property (nonatomic, strong) UIView *HuaBanView;
@property (nonatomic, strong) UIButton *switchBtn;
@property (nonatomic, strong) UIImageView *signatureImg;
@end

@implementation HBViewController
#pragma mark - viewDidLoad
//将要开始
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //隐藏tabbar
    self.tabBarController.tabBar.hidden = YES;
}
//将要结束
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //显示tabbar
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //PS:基于oc的事件传递原理，请按顺序加载
    //1.加载界面
    [self loadUI];

    //默认绘画模式，关闭UIScrollView的上下移动，开启drawView的交互
    _sc.scrollEnabled =NO;
    self.drawView.userInteractionEnabled = YES;
  
    //3.加载工具栏
    [self loadDrawView];
    
    
}
#pragma mark -loadUI
- (void)loadUI{
    //添加scview
    [self.view addSubview:self.sc];
    //添加view，用于承载画布
    [_sc addSubview:self.HuaBanView];
    //创建画布对象
    DrawView *drawView = [[DrawView alloc]init];
    drawView.backgroundColor = [UIColor clearColor];
    [_HuaBanView addSubview:drawView];
    self.drawView = drawView;
    //添加是否允许绘画开关
    [self.view addSubview:self.switchBtn];
    //添加小的签名图片
    [self.view addSubview:self.signatureImg];
    
    UIView *view = self.view;
    _sc.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .bottomSpaceToView(view, 0);
    
    _HuaBanView.sd_layout
    .topSpaceToView(_sc, 0)
    .leftSpaceToView(_sc, 0)
    .rightSpaceToView(_sc, 0)
    .bottomSpaceToView(_sc, 0);
    
    _switchBtn.sd_layout
    .centerYIs(view.frame.size.height/2-100)
    .leftSpaceToView(view, 10)
    .widthIs(30)
    .heightIs(30);
    
    _signatureImg.sd_layout
    .bottomSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .widthIs(view.frame.size.width/4)
    .heightIs(view.frame.size.height/4);
    
    //这里确定画布的大小
    drawView.sd_layout
    .topEqualToView(_HuaBanView)
    .leftEqualToView(_HuaBanView)
    .bottomEqualToView(_HuaBanView)
    .rightEqualToView(_HuaBanView);
    
}
- (void)loadDrawView{
    
    __weak typeof(self) weakSelf = self;
    //工具栏
    ToolView *toolView = [[ToolView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, CTStopStatusRect+CTStopNavRect) afterSelectEraser:^{
        //清屏
        [weakSelf dismissViewControllerAnimated:YES completion:^{
        }];
    } afterSelectColor:^(UIColor *color) {
        //给绘图视图设置颜色
        [_drawView setDrawColor:color];
        [_drawView setLineWidth:3.0];
    } afterSelectLineWidth:^(CGFloat lineWidth) {
        //给绘图视图设置线宽
        [_drawView setLineWidth:lineWidth];
    } afterSelectUndo:^{
        //撤销
        [_drawView undoStep];

    } afterSelectClearScreen:^{
        [weakSelf qingping];
       
    } afterSelectSave:^{
        //保存图片
        [weakSelf Savelat:_signatureImg];
            }];

    [self.view addSubview:toolView];
}

- (void)home:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {

        NSLog(@"1");
        //默认非绘画模式，开启UIScrollView的上下移动，关闭drawView的交互
        _sc.scrollEnabled =YES;
        self.drawView.userInteractionEnabled = NO;
    }else{
        
        NSLog(@"2");
        //默认绘画模式，关闭UIScrollView的上下移动，开启drawView的交互
        _sc.scrollEnabled =NO;
        self.drawView.userInteractionEnabled = YES;
    }
}

#pragma mark - 照片选择代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    
    //设置绘图视图
    [self.drawView setImage:image];
    
    //关闭照片选择窗口
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UIScrollViewDelegate
//指定UIScrollView上面需要缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //取到scrollView上面的子视图 imgView
    return [scrollView viewWithTag:101];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"已经缩放, 只要在缩放就会调用, 当前缩放比率为%f", scrollView.zoomScale);
    //居中代码
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;

    _HuaBanView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                            scrollView.contentSize.height * 0.5 + offsetY);
    
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"将要开始缩放");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"已经结束缩放");
}

- (void)qingping{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定清空规图？" preferredStyle: UIAlertControllerStyleAlert];
    __weak typeof(alert) wAlert = alert;
    [wAlert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [wAlert addAction:[UIAlertAction actionWithTitle:@"我要清空" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //清屏
        [_drawView clearScreen];
    }]];
    
    [self presentViewController:wAlert animated:true completion:nil];
}
//保存图片
- (void)Savelat:(UIImageView *)imaview{
    
    UIGraphicsBeginImageContext(_HuaBanView.bounds.size);     //vv 当前的view
    [_HuaBanView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    //保存图片
//    Alerts(@"提示", @"保存成功");
    imaview.image = viewImage;
}

#pragma mark - 懒加载
//self.view上第一层，用于放大缩小
- (UIScrollView *)sc{
    if (!_sc) {
        _sc =[[UIScrollView alloc]init];
        _sc.backgroundColor = backgrodColor;
        //        _sc.contentSize = CGSizeMake(_sc.bounds.size.width, _sc.bounds.size.height);
        _sc.maximumZoomScale = 1;
        _sc.minimumZoomScale = 0.5;
        _sc.delegate = self;
    }
    return _sc;
}
//_sc上第一层，用于添加画布
- (UIView *)HuaBanView{
    if (!_HuaBanView) {
        _HuaBanView= [[UIView alloc]init];
        _HuaBanView.tag = 101;
        _HuaBanView.backgroundColor = [UIColor clearColor];
    }
    return _HuaBanView;
}
- (UIButton *)switchBtn{
    if (!_switchBtn) {
        _switchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _switchBtn.clipsToBounds=YES;
        _switchBtn.layer.cornerRadius = _switchBtn.bounds.size.width/2;
        [_switchBtn setBackgroundImage:[UIImage imageNamed:@"SP"] forState:UIControlStateNormal];
        [_switchBtn setBackgroundImage:[UIImage imageNamed:@"JP"] forState:UIControlStateSelected];
        [_switchBtn addTarget:self action:@selector(home:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchBtn;
}
- (UIImageView *)signatureImg{
    if (!_signatureImg) {
        _signatureImg = [[UIImageView alloc]init];
        _signatureImg.backgroundColor = [UIColor yellowColor];
    }
    return _signatureImg;
}
@end
