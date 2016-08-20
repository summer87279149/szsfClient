//
//  TabelCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
@interface TabelCellModel : BasicModel
//项目名字
@property(nonatomic,copy)NSString *name;

//附近多少人可约
@property(nonatomic,copy)NSString *distance;
@end
