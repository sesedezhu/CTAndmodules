//
//  LargeViewCell.m
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import "LargeViewCell.h"

@interface LargeViewCell()
@property (nonatomic, strong) UIView *BackView;    //背景view
@property (nonatomic, strong) UILabel *NicknameLab;      //昵称
@property (nonatomic, strong) UILabel *TimeLab;          //时间
@property (nonatomic, strong) UILabel *ContentLab;       //内容
@property (nonatomic, strong) UIImageView *EllipsisImaView;  //省略号图片
@end

@implementation LargeViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI{
    self.backgroundColor = [UIColor clearColor];
    self.BackView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_BackView];
    [_BackView addSubview:self.NicknameLab];
    [_BackView addSubview:self.TimeLab];
    [_BackView addSubview:self.ContentLab];
    [_BackView addSubview:self.EllipsisImaView];
    
    UIView *view = self.contentView;
    _BackView.sd_layout
    .topSpaceToView(view, 0)
    .leftSpaceToView(view, 0)
    .bottomSpaceToView(view, 0)
    .rightSpaceToView(view, 0);
    
    _NicknameLab.sd_layout
    .topSpaceToView(_BackView, CONVER_VALUE(22))
    .leftSpaceToView(_BackView, CONVER_VALUE(21))
    .rightSpaceToView(_BackView, CONVER_VALUE(21))
    .heightIs(CONVER_VALUE(18));
    
    _TimeLab.sd_layout
    .topSpaceToView(_NicknameLab, CONVER_VALUE(14))
    .leftEqualToView(_NicknameLab)
    .rightEqualToView(_NicknameLab)
    .heightIs(CONVER_VALUE(8));
    
    _ContentLab.sd_layout
    .topSpaceToView(_TimeLab, CONVER_VALUE(22))
    .leftEqualToView(_NicknameLab)
    .rightEqualToView(_NicknameLab)
    .autoHeightRatio(0);
    _ContentLab.isAttributedContent = YES;
    
    _EllipsisImaView.sd_layout
    .bottomSpaceToView(_BackView, CONVER_VALUE(12))
    .leftSpaceToView(_BackView, CONVER_VALUE(13))
    .widthIs(CONVER_VALUE(20))
    .heightIs(CONVER_VALUE(20));
    
    _NicknameLab.text = @"大帅哥程";
    _TimeLab.text = @"2018.08.18";
    _ContentLab.text = @"别丢掉 这一把过往的热情，\n现在流水似的，轻轻 在幽冷的山泉底，在黑夜，在松林，叹息似的渺茫，你仍要保存着那真！一样是明月，\n一样是隔山灯火，满天的星，只有人不见，梦似的挂起，你向黑夜要回 那一句话--你仍得相信 山谷中留着 有那回音！";
    [_EllipsisImaView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"WK_ellipsisBack"]];
    
    //获取文字内容的高度
    UIFont * font = [UIFont systemFontOfSize:CONVER_VALUE(12)];
    //设置label的富文本
    _ContentLab.attributedText = [self attributedStringFromStingWithFont:font withLineSpacing:CONVER_VALUE(8) text:_ContentLab.text];
    //设置富文本后需要再调用这个方法
    [_ContentLab setMaxNumberOfLinesToShow:4];//自适应高度的时候限制控件最大行数
    
//    _ContentLab.backgroundColor = [UIColor redColor];
    
}
- (void)setDataDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    _NicknameLab.text = dataDic[@"name"];
}

#pragma mark - 懒加载
- (UIView *)BackView{
    if (!_BackView) {
        _BackView = [[UIView alloc]init];
        //变圆
        _BackView.layer.cornerRadius = CONVER_VALUE(5);//半径大小
        _BackView.layer.masksToBounds = YES;//是否切割
    }
    return _BackView;
}
- (UILabel *)NicknameLab{
    if (!_NicknameLab) {
        _NicknameLab = [[UILabel alloc]init];
        _NicknameLab.textColor = allcolorAlphasCT(0, 0, 0, 1.0);
        _NicknameLab.font = [UIFont systemFontOfSize:CONVER_VALUE(18)];
    }
    return _NicknameLab;
}
- (UILabel *)TimeLab{
    if (!_TimeLab) {
        _TimeLab = [[UILabel alloc]init];
        _TimeLab.textColor = allcolorAlphasCT(102, 102, 102, 1.0);
        _TimeLab.font = [UIFont systemFontOfSize:CONVER_VALUE(10)];
    }
    return _TimeLab;
}
- (UILabel *)ContentLab{
    if (!_ContentLab) {
        _ContentLab = [[UILabel alloc]init];
        _ContentLab.textColor = allcolorAlphasCT(73, 73, 73, 1.0);
    }
    return _ContentLab;
}
- (UIImageView *)EllipsisImaView{
    if (!_EllipsisImaView) {
        _EllipsisImaView = [[UIImageView alloc]init];
    }
    return _EllipsisImaView;
}
/**
 *  NSString转换成NSMutableAttributedString
 *  @param font  字体
 *  @param lineSpacing  行间距
 *  @param text  内容
 */
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing
                                                           text:(NSString *)text{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail]; //截断方式，"abcd..."
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [text length])];
    return attributedStr;
}

@end
