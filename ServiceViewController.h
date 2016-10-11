//
//  ServiceViewController.h
//  FootMassage
//
//  Created by Admin on 16/8/6.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceViewController : UIViewController
//项目ID
@property(nonatomic,strong) NSString *projectID;
//该项目的技师id
@property(nonatomic,strong) NSString *techID;
//项目介绍view
@property(nonatomic,strong) UIView *projectView;
//名字
@property (nonatomic,strong) UILabel *name;
//作用、适宜：
@property (nonatomic,strong) UILabel *shiyi;
//时长 选择人数
@property(nonatomic,strong) UILabel *time;
// 价格
@property(nonatomic,strong) UILabel *price;
//评论、好评
@property(nonatomic,strong) UILabel *comments;
//显示评论的View
@property(nonatomic,strong) UIView *commentView;
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

//服务介绍View
@property(nonatomic,strong) UIView *ServiceIntroduceView;
//服务说明
@property (strong, nonatomic) UILabel*serviceInfo;
//预约须知
@property (strong, nonatomic) UILabel *orderNeedKnow;
//针对部位
@property (strong, nonatomic) UILabel *aimAt;
@end
