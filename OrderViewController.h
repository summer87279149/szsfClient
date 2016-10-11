//
//  OrderViewController.h
//  foot
//
//  Created by Admin on 16/8/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModal.h"
@interface OrderViewController : UIViewController
////是否支持上门  “1”支持  “0”不支持
//@property (nonatomic,copy) NSString *isToMyHome;
////项目id
//@property (nonatomic,copy) NSString *pid;
////项目名字
//@property (nonatomic,copy) NSString *pName;
////技师id
//@property (nonatomic,copy) NSString *tid;


@property (nonatomic,strong)ProjectModal *projectModal;





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
