//
//  MallSectionModel.h
//  foot
//
//  Created by Admin on 16/10/13.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface MallSectionModel : BasicModel
//订单号
@property(nonatomic,copy) NSString *orderNumber;
//总价格
@property(nonatomic,copy) NSString *totalPrice;
//下单时间
@property(nonatomic,copy) NSString *time;
//详细的商品数组
@property(nonatomic,strong) NSMutableArray *detailArr;
@end
