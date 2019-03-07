//
//  CellView007.h
//  CT实用modules
//
//  Created by 涛程 on 2019/3/7.
//  Copyright © 2019年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellView007 : UIView
@property(nonatomic ,strong) UILabel *Lab_title;       //标题
@property(nonatomic ,strong) UILabel *Lab_date;       //日期
@property(nonatomic ,strong) UILabel *Lab_content;       //内容
@property(nonatomic ,strong) UILabel *Lab_numberText;       //数量文案
@property(nonatomic ,strong) UILabel *Lab_number;       //数量
@property(nonatomic ,strong) UIImageView *Ima_left;  //cell左侧头像图标
@property(nonatomic ,strong) UIView *View_line;       //cell自定义人为线条
@end


/*     默认高度 200     */
NS_ASSUME_NONNULL_END
/*
 *********************  自适应cell高度,ctrl中的设置
 //每组cell高度
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 FoundModel *homecell = [_messDataArr NLW_objectAtIndex:indexPath.section];
 Class currentClass = [FoundCell class];
 // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
 //model 为模型实例， keyPath 为cell中 model 的属性名，通过 kvc 统一赋值接口
return [self.TableViewTwo cellHeightForIndexPath:indexPath model:homecell keyPath:@"model" cellClass:currentClass contentViewWidth:[self cellContentViewWith]];
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
 
 
 
 */
