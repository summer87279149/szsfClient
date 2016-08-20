//
//  myTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/8/6.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TechCellModel.h"
@interface myTableViewCell : UITableViewCell
//左边图片
@property(nonatomic,strong) UIImageView* imageview;
//名字
@property(nonatomic,strong) UILabel *name;

//作用、适宜：
@property(nonatomic,strong) UILabel *shiyi;
//时长 选择人数
@property(nonatomic,strong) UILabel *time;

// 价格
@property(nonatomic,strong) UILabel *price;

//预约按钮
@property(nonatomic,strong) UIButton *button;

@property(nonatomic,strong) TechCellModel*techCellModel;
@end
