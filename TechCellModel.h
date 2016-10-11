//
//  TechCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface TechCellModel : BasicModel
//项目ID
@property (nonatomic,copy)NSString *projectID;
//
@property (nonatomic,copy)NSString *imageviewUrl;
//
@property(nonatomic,copy)NSString *name;
//
@property(nonatomic,copy)NSString *shiyi;
//
@property(nonatomic,copy)NSString *time;
//选择人数
@property(nonatomic,copy)NSString *chooseNum;
//
@property(nonatomic,copy)NSString *price;



@end
