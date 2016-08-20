//
//  MyFocusTableViewCell.h
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFocusCellModel.h"
@interface MyFocusTableViewCell : UITableViewCell
//显示技师头像、姓名等的View
@property(nonatomic,strong) UIView *techView;
//技师头像
@property(nonatomic,strong) UIImageView *portrait;
//技师名字
@property(nonatomic,strong) UILabel *techName;
//名师认证章图标
@property(nonatomic,strong) UIImageView *AuthenticationImage;
//技能、工作年限
@property (strong, nonatomic) UILabel *skill;
//服务次数
@property (strong, nonatomic) UILabel *serviceTimes;


@property(nonatomic,strong) MyFocusCellModel *myFocusCellModel;
@end
