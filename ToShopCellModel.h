//
//  ToShopCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
@interface ToShopCellModel : BasicModel
//shopID
@property(nonatomic,copy)NSString *shopID;
//图片
@property(nonatomic,copy)NSString *imageUrl;
//名称
@property(nonatomic,copy)NSString *name;
//店铺描述
@property(nonatomic,copy)NSString *descrip;
//均价
@property(nonatomic,copy)NSString *price;
//评分
@property(nonatomic,assign)float star;
//距离
@property(nonatomic,copy)NSString *near;

@end
