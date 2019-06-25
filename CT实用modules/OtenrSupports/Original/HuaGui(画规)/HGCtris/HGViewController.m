//
//  HGViewController.m
//  商报彩票
//
//  Created by 涛程 on 16/12/2.
//  Copyright © 2016年 涛程. All rights reserved.
//

#import "HGViewController.h"
#import "LAndRRequest.h"
//画规背景颜色
#define backgrodColor [UIColor grayColor]

@interface HGViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,ZYHttpManagerDelegate>
{
        UIScrollView *sc;
        UIView *vv;
}
@end

@implementation HGViewController
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //PS:基于oc的事件传递原理，请按顺序加载
    //1.加载界面
    [self loadUI];
    //2.加载数据
    [self loadData];
    
    //默认绘画模式，关闭UIScrollView的上下移动，开启drawView的交互
    sc.scrollEnabled =NO;
    self.drawView.userInteractionEnabled = YES;
    
}
- (void)loadUI{
    //创建上下移动
    sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+64)];
    sc.backgroundColor = backgrodColor;
    sc.contentSize = CGSizeMake(sc.bounds.size.width, sc.bounds.size.height*3.2);
    sc.maximumZoomScale = 1;
    sc.minimumZoomScale = 0.5;
    sc.delegate = self;
    [self.view addSubview:sc];
    
    vv= [[UIView alloc]initWithFrame:CGRectMake(0, 0,sc.bounds.size.width , sc.bounds.size.height*3.2+100)];
//    vv.backgroundColor = backgrodColor;
    vv.tag = 101;
    [sc addSubview:vv];
}
- (void)loadData{
    
    [MBProgressHUD showLoadHUDMsg:@"加载中..."];
    
    self.manager=[[LAndRRequest alloc]init];
    self.manager.delegate=self;
    self.manager.tag = 312;
    NSString *time = [self.manager getCurrentTimestamp];
    
    self.messageDic = [[NSMutableDictionary alloc]init];
    [self.messageDic setObject:@"get_lottery" forKey:@"action"];
    [self.messageDic setObject:@"1" forKey:@"page_index"];
    [self.messageDic setObject:@"40" forKey:@"list_rows"];
    [self.messageDic setObject:@"217013393" forKey:@"appid"];
    [self.messageDic setObject:@"TY2CRg0U7lpdDhDSsPTotedrokE" forKey:@"sign"];
    [self.messageDic setObject:time forKey:@"time"];
    
    [self.manager startPostConnectionWithPath:@"" parameter:self.messageDic CaCha:NO];
}
//成功了
- (void)successToRequest:(LAndRRequest* )manager withData:(id)data{
    //隐藏风火轮
    [MBProgressHUD hideHUD];
    
    if (manager.tag == 312){
        //上拉刷新，移除数组中的数据重新赋值
//        [self.dataArr removeAllObjects];
        NSNumber *status = [data objectForKey:@"status"];
        NSString *log = [NSString stringWithFormat:@"%@", status];
        if ([log isEqualToString:@"1"]){
            NSArray *result = data[@"data"];
            for (NSDictionary *dic in result) {
                viewcellModel *model = [[viewcellModel alloc] init];
                model.qihao = dic[@"qihao"];
                model.qswzh = dic[@"qswzh"];
                model.serial = dic[@"serial"];
                model.number_1 = dic[@"number_1"];
                model.number_2 = dic[@"number_2"];
                model.number_3 = dic[@"number_3"];
                model.number_4 = dic[@"number_4"];
                model.number_5 = dic[@"number_5"];
                model.number_6 = dic[@"number_6"];
                model.number_7 = dic[@"number_7"];
                
                [self.dataArr addObject:model];
            }
            for (int i = 0 ; i < _dataArr.count; i++) {
                
                viewcell *viewcells =[[viewcell alloc]initWithFrame:CGRectMake(0, TRANS_VALUE(43.0f )*i+i, self.view.bounds.size.width, TRANS_VALUE(43.0f ))];
                [vv addSubview:viewcells];
                
                viewcells.model = _dataArr[i];
            }
            //3.加载画布
            [self loadDrawView];
            _Load = 0;
        }else{
            NSString *info = data[@"info"];
            [MBProgressHUD showHUDMsg:info];
            _Load = 1;
        }
    }
}
//失败了
- (void)failToRequest:(LAndRRequest* )manager withData:(id)data{
    _Load = 1;
}
- (void)loadDrawView{
    
    //画布
    DrawView *drawView = [[DrawView alloc]initWithFrame:vv.bounds];
    drawView.backgroundColor = CTColorClear;
    
    [vv addSubview:drawView];
    self.drawView = drawView;
//    __weak typeof(drawView) wdrawView = drawView;
    
    //添加控制绘画开关
    UIButton * backButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton2.frame = CGRectMake(TRANS_VALUE(10.0f),[UIScreen mainScreen].bounds.size.height/2-TRANS_VALUE(35.0f)/2, TRANS_VALUE(35.0f), TRANS_VALUE(35.0f));
    

    backButton2.clipsToBounds=YES;
    backButton2.layer.cornerRadius = backButton2.bounds.size.width/2;
    [backButton2 setBackgroundImage:[UIImage imageNamed:@"SP"] forState:UIControlStateNormal];
    [backButton2 setBackgroundImage:[UIImage imageNamed:@"JP"] forState:UIControlStateSelected];
    [backButton2 addTarget:self action:@selector(home:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton2];
    
    //添加画笔开关
    UIButton * backButton3 = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton3.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - TRANS_VALUE(45.0f),[UIScreen mainScreen].bounds.size.height - TRANS_VALUE(45.0f), TRANS_VALUE(35.0f),TRANS_VALUE(35.0f));
    backButton3.clipsToBounds=YES;
    backButton3.layer.cornerRadius = backButton3.bounds.size.width/2;
    [backButton3 setBackgroundImage:[UIImage imageNamed:@"ZDY"] forState:UIControlStateNormal];
    [backButton3 setBackgroundImage:[UIImage imageNamed:@"ZB"] forState:UIControlStateSelected];

    [backButton3 addTarget:self action:@selector(Lines:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton3];
    
    __weak typeof(self) weakSelf = self;
    //工具栏
    ToolView *toolView = [[ToolView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64) afterSelectEraser:^{
        //清屏
//        [_drawView clearScreen];
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
        [weakSelf Savelat];
            }];

    [self.view addSubview:toolView];
}

- (void)home:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {

        NSLog(@"1");
        //默认非绘画模式，开启UIScrollView的上下移动，关闭drawView的交互
        sc.scrollEnabled =YES;
        self.drawView.userInteractionEnabled = NO;
    }else{
        
        NSLog(@"2");
        //默认绘画模式，关闭UIScrollView的上下移动，开启drawView的交互
        sc.scrollEnabled =NO;
        self.drawView.userInteractionEnabled = YES;
    }
}
- (void)Lines:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        
        _drawView.Line = 1;
    }else{
        _drawView.Line = 0;
        
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

    vv.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
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
- (void)Savelat{
    
    UIGraphicsBeginImageContext(vv.bounds.size);     //vv 当前的view
    [vv.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    //保存图片
    MBHUD_Warning(@"保存成功");
}
//将要开始
- ( void )viewWillAppear:( BOOL )animated
{
    //隐藏tabbar
    self.tabBarController.tabBar.hidden = YES;
    //2.加载数据
    if (_Load == 1){
        [self loadData];
    }
}
//将要结束
- (void)viewWillDisappear:(BOOL)animated{
    //显示tabbar
    
    self.tabBarController.tabBar.hidden = NO;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
