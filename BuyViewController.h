//
//  BuyViewController.h
//  foot
//
//  Created by Admin on 16/8/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyViewController : UIViewController


//商品名字
@property (nonatomic,strong) UILabel *name;

//项目价格
@property (nonatomic,strong) UILabel *projectPrice;

//手机号码
@property (nonatomic,strong) UITextField *phoneNumber;

//手机号码
@property (nonatomic,strong) UIButton *commitOrderBtn;



//上门服务时间
@property (nonatomic,strong) UILabel *ToMyHomeTimeLabel;

//上门服务地址
@property (nonatomic,strong) UILabel *ToMyHomeAddLabel;

@end
