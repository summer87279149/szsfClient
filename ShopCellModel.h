//
//  ShopCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface ShopCellModel : BasicModel

@property(nonatomic,copy) NSString *image;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *price;

@property(nonatomic,copy) NSString *chooseNumber;

@property(nonatomic,copy) NSString *time;

@property(nonatomic,copy) NSString *projectId;
//是否收藏店铺
@property(nonatomic,copy) NSString *isFocus;
@end
