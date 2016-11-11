//
//  MyOrderCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJname             @"projectname"
#define XXJstatus           @"orderstate"
#define XXJcounts           @"num"
#define XXJprice            @"totalprice"
#define XXJimageUrl         @"logo"
#define XXJorderNnumber     @"zid"
#define XXJIsRemarked       @"isremarked"
#import "MyOrderCellModel.h"

@implementation MyOrderCellModel

-(void)parseFromDictionary:(NSDictionary *)dic{
    
    // tou xiang
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    
    // ming zi
    if ([dic objectForKey:XXJstatus]==nil||[dic objectForKey:XXJstatus] == [NSNull null])
    {
        self.status = @"";
    }
    else
    {
        self.status = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJstatus]];
    }
    
    // tou xiang
    if ([dic objectForKey:XXJcounts]==nil||[dic objectForKey:XXJcounts] == [NSNull null])
    {
        self.counts = @"";
    }
    else
    {
        self.counts = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJcounts]];
    }
    
    // ming zi
    if ([dic objectForKey:XXJprice]==nil||[dic objectForKey:XXJprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprice]];
    }
    
    // tou xiang
    if ([dic objectForKey:XXJimageUrl]==nil||[dic objectForKey:XXJimageUrl] == [NSNull null])
    {
        self.imageUrl = @"";
    }
    else
    {
        self.imageUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageUrl]];
    }
    
    // ming zi
    if ([dic objectForKey:XXJorderNnumber]==nil||[dic objectForKey:XXJorderNnumber] == [NSNull null])
    {
        self.orderNnumber = @"";
    }
    else
    {
        self.orderNnumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJorderNnumber]];
    }

    // 是否评价过
    if ([dic objectForKey:XXJIsRemarked]==nil||[dic objectForKey:XXJIsRemarked] == [NSNull null])
    {
        self.isRemarked = @"0";
    }
    else
    {
        self.isRemarked = [NSString stringWithFormat:@"%d",[[dic objectForKey:XXJIsRemarked] intValue]];
    }

    
}
@end
