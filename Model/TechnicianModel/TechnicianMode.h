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

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *score;
@property(nonatomic,strong)NSString *shopName;
@property(nonatomic,strong)NSString *technicianID;
@property(nonatomic,strong)NSString *orderqty;
@property(nonatomic,strong)NSString *headimgurl;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *distance;
@end
