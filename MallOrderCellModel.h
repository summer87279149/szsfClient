//
//  MallOrderCellModel.h
//  foot
//
//  Created by Admin on 16/10/12.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface MallOrderCellModel : BasicModel

@property(nonatomic,copy) NSString *productID;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *status;

@property(nonatomic,copy) NSString *counts;

@property(nonatomic,copy) NSString *price;

@property(nonatomic,copy) NSString *imageUrl;

@property(nonatomic,copy) NSString *orderNnumber;
@end
