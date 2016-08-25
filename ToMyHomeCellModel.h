//
//  ToMyHomeCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BasicModel.h"
@interface ToMyHomeCellModel : BasicModel

//技师ID
@property(nonatomic,copy) NSString* techID;

//头像
@property(nonatomic,copy) NSString* imageviewUrl;

//名字
@property(nonatomic,copy) NSString *name;

//评分：
@property(nonatomic,copy) NSString *grade;

//单数
@property(nonatomic,copy) NSString *orderNumber;

//距离：
@property(nonatomic,copy) NSString *distance;

//服务说明文字
@property(nonatomic,copy) NSString *text;

//项目
@property(nonatomic,copy) NSString *project;

//技师所属
@property(nonatomic,copy) NSString *belongTo;
@end
