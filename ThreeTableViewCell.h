//
//  ThreeTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/8/8.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
@interface ThreeTableViewCell : UITableViewCell
//名字
@property(nonatomic,strong) UILabel *name;

//评论：
@property(nonatomic,strong) UILabel *comments;
//项目
@property(nonatomic,strong) UILabel *project;

// 时间
@property(nonatomic,strong) UILabel *time;

//星星评价
@property(nonatomic,strong)TQStarRatingView *star;
@end
