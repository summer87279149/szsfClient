//
//  OrderViewController.h
//  foot
//
//  Created by Admin on 16/8/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController

//指定技师姓名
@property (nonatomic,strong) UILabel *appointTechName;

//项目名字
@property (nonatomic,strong) UILabel *projectName;

//项目价格
@property (nonatomic,strong) UILabel *projectPrice;

//手机号码
@property (nonatomic,strong) UITextField *phoneNumber;

//手机号码
@property (nonatomic,strong) UIButton *commitOrderBtn;

//选择到店服务
@property (nonatomic,strong) UIButton *toShopBtn;

//选择上门服务
@property (nonatomic,strong) UIButton *ToMyHomeBtn;

//上门服务时间
@property (nonatomic,strong) UILabel *ToMyHomeTimeLabel;

//上门服务地址
@property (nonatomic,strong) UILabel *ToMyHomeAddLabel;
@end
