//
//  ShopMode.h
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"

//商店模型
@interface ShopMode : BasicModel


//商店id
@property(nonatomic,strong)NSString *shopID;

//图片
@property(nonatomic,strong)NSString *shopImagesURL;

//店名
@property(nonatomic,strong)NSString *shopName;

//地址
@property(nonatomic,strong)NSString *shopAddress;

//商店经度（meiyong）
@property(nonatomic,strong)NSString *latitude;

//商店纬度（meiyong）
@property(nonatomic,strong)NSString *longitude;

//商家电话
@property(nonatomic,strong)NSString *shopPhone;

//已售
@property(nonatomic,strong)NSString *shopOrderqty;

//用户评价数量
@property(nonatomic,strong)NSString *commentsNumber;

//好评率
@property(nonatomic,strong)NSString *goodCommentRare;
//距离
@property(nonatomic,strong)NSString *distance;


@end
