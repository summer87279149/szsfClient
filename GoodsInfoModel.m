//
//  GoodsInfoModel.m
//  ShoppingList_Demo
//
//  Created by 李金华 on 15/4/21.
//  Copyright (c) 2015年 LJH. All rights reserved.
//

#import "GoodsInfoModel.h"

@implementation GoodsInfoModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.pid = dict[@"pid"];
        self.imageName = dict[@"images"];
        self.goodsTitle = dict[@"prodname"];
        self.goodsPrice = dict[@"price"];
        self.goodsNum = [dict[@"amount"]intValue];
        self.selectState = [dict[@"selectState"]boolValue];
    }
    return  self;
}

@end
