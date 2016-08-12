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
{
    NSString *shopAddress;
    NSString *shopID;
    NSString *shopImagesURL;
    NSString *shopInfo;
    NSString *latitude;
    NSString *longitude;
    NSString *shopOrderqty;         //订单数量
    NSString *shopName;
    NSString *shopPhone;
    NSString *shopFloorprice;
    NSString *shopDistance;
    NSString *shopScore;
}
@property(nonatomic,strong)NSString *shopAddress;
@property(nonatomic,strong)NSString *shopID;
@property(nonatomic,strong)NSString *shopImagesURL;
@property(nonatomic,strong)NSString *shopInfo;
@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *longitude;
@property(nonatomic,strong)NSString *shopOrderqty;
@property(nonatomic,strong)NSString *shopName;
@property(nonatomic,strong)NSString *shopPhone;
@property(nonatomic,strong)NSString *shopFloorprice;
@property(nonatomic,strong)NSString *shopDistance;
@property(nonatomic,strong)NSString *shopScore;
@end
