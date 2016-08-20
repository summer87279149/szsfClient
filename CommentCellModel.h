//
//  CommentCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface CommentCellModel : BasicModel
//用户名
@property(nonatomic,copy) NSString *name;
//项目名
@property(nonatomic,copy) NSString *serviceName;
//订单时间
@property(nonatomic,copy) NSString *time;
//评价内容
@property(nonatomic,copy) NSString *commentContent;
//评分
@property(nonatomic,copy) float grade;

@end
