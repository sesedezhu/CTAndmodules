//
//  SmallViewCell.h
//  CT实用modules
//
//  Created by 涛程 on 2018/8/9.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^longClickBlock)(void);
typedef void (^deleteBtnBlock)(NSIndexPath *indexPath);
@interface SmallViewCell : UICollectionViewCell

@property(nonatomic, copy)longClickBlock longClickBlocks;
@property(nonatomic, copy)deleteBtnBlock deleteBtnBlocks;

@property(nonatomic, strong)NSDictionary *dataDic;//数据源
@property (nonatomic,strong) UIButton *deleteBtn;  //删除按钮
@property (nonatomic,strong)NSIndexPath *indexPath;

@property (nonatomic, strong) UILabel *NicknameLab;      //昵称
@end
