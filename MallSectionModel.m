//
//  MallSectionModel.m
//  foot
//
//  Created by Admin on 16/10/13.
//  Copyright © 2016年 Admin. All rights reserved.
//
//

#define XXJOrderNumber          @"id"
#define XXJPrice                @"totalprice"
#define XXJTime                 @"createtime"
#define XXJDetailProductsArr    @"products"
#import "MallSectionModel.h"

@implementation MallSectionModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    
    
    if ([dic objectForKey:XXJOrderNumber]==nil||[dic objectForKey:XXJOrderNumber] == [NSNull null])
    {
        self.orderNumber = @"";
    }
    else
    {
        self.orderNumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJOrderNumber]];
    }
    
    
    if ([dic objectForKey:XXJPrice]==nil||[dic objectForKey:XXJPrice] == [NSNull null])
    {
        self.totalPrice = @"";
    }
    else
    {
        self.totalPrice = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJPrice]];
    }
    // ming zi
    if ([dic objectForKey:XXJTime]==nil||[dic objectForKey:XXJTime] == [NSNull null])
    {
        self.time = @"";
    }
    else
    {
        self.time = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTime]];
    }
    
  
    self.detailArr = [[NSMutableArray alloc]init];
    
    
}


@end
