//
//  ProjectModal.h
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
#import "TechnicianMode.h"
@interface ProjectModal : BasicModel
//服务模型

//项目ID
@property(nonatomic,strong)NSString *projectID;
//图片URL 3张
@property(nonatomic,strong)NSArray *imageURLArray;
//项目名字
@property(nonatomic,strong)NSString *projectName;
//项目疗效
@property(nonatomic,strong)NSString *effect;
//价格
@property(nonatomic,strong)NSString *price;
//时长
@property(nonatomic, copy)NSString *time;
//选择人数
@property(nonatomic, copy)NSString *chooseNumber;
//评价条数
@property(nonatomic, copy)NSString *commentsNumber;
//好评率
@property(nonatomic, copy)NSString *goodComments;
//技师模型
@property (nonatomic,strong)TechnicianMode *techModal;
//服务说明
@property(nonatomic, copy)NSString *serviceInfo;
//服务需知
@property(nonatomic, copy)NSString *serviceKnow;
//针对部位
@property(nonatomic, copy)NSString *aimAt;
@end
