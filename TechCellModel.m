//
//  TechCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJProjectID        @"id"
#define XXJimageview        @"logo"
#define XXJname             @"projectname"
#define XXJshiyi            @"effect"
#define XXJtime             @"time"
#define XXJSelectNum        @"selectnum"
#define XXJprice            @"price"


#import "TechCellModel.h"

@implementation TechCellModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    //
    if ([dic objectForKey:XXJProjectID] == nil ||
        [dic objectForKey:XXJProjectID] == [NSNull null])
    {
        self.projectID = @"";
    }
    else
    {
        self.projectID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJProjectID]];
    }
    //
    if ([dic objectForKey:XXJimageview] == nil ||
        [dic objectForKey:XXJimageview] == [NSNull null])
    {
        self.imageviewUrl = @"";
    }
    else
    {
        self.imageviewUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageview]];
    }
    
    
    //
    if ([dic objectForKey:XXJname] == nil ||
        [dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    
    
    
    //
    if ([dic objectForKey:XXJshiyi] == nil ||
        [dic objectForKey:XXJshiyi] == [NSNull null])
    {
        self.shiyi = @"";
    }
    else
    {
        self.shiyi = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJshiyi]];
    }
    
    
    //
    if ([dic objectForKey:XXJtime] == nil ||
        [dic objectForKey:XXJtime] == [NSNull null])
    {
        self.time = @"";
    }
    else
    {
        self.time = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJtime]];
    }
    //
    if ([dic objectForKey:XXJSelectNum] == nil ||
        [dic objectForKey:XXJSelectNum] == [NSNull null])
    {
        self.chooseNum = @"";
    }
    else
    {
        self.chooseNum = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJSelectNum]];
    }
    
    
    //
    if ([dic objectForKey:XXJprice] == nil ||
        [dic objectForKey:XXJprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprice]];
    }
    
    
   }

@end
