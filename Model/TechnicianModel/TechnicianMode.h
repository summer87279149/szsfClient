//
//  TechnicianMode.h
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"

//技师模型
@interface TechnicianMode : BasicModel
//技师ID
@property(nonatomic,strong)NSString *technicianID;
//技师名字
@property(nonatomic,strong)NSString *name;
//头像
@property(nonatomic,strong)NSString *headimgurl;
//是否有名师认证图标
@property(nonatomic,copy) NSString *AuthenticationImage;
//技师工作年限
@property(nonatomic,strong)NSString *years;
//技能
@property(nonatomic,copy) NSString *skill;
//服务次数
@property(nonatomic,copy) NSString *serviceTimes;
//是否关注
@property(nonatomic,copy) NSString *isFocus;
//技师介绍
@property(nonatomic,strong)NSString *techIntroduction;
//用户评价数量
@property(nonatomic,strong)NSString *commentsNumber;
//好评率
@property(nonatomic,strong)NSString *goodCommentRare;




@end
