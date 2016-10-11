//
//  MyFocusCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface MyFocusCellModel : BasicModel
//技师ID
@property(nonatomic,strong)NSString *technicianID;
//
@property(nonatomic,copy) NSString *portrait;
//技师名字
@property(nonatomic,copy) NSString *techName;
//是否有名师认证图标
@property(nonatomic,copy) NSString *AuthenticationImage;
//技能
@property(nonatomic,copy) NSString *skill;
//服务次数
@property(nonatomic,copy) NSString *serviceTimes;

//技师工作年限
@property(nonatomic,strong)NSString *years;
@end
