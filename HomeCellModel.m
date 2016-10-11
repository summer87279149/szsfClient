//
//  HomeCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJdistance                              @"distance"
#define XXJname                                    @"shopname"
#define XXJShopID                                    @"sid"
#define XXJShopImage                                    @"images"
#import "HomeCellModel.h"

@implementation HomeCellModel
- (void)parseFromDictionary:(NSDictionary *)dic
{
    
    if ([dic objectForKey:XXJdistance]==nil||[dic objectForKey:XXJdistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJdistance]];
    }
    
    
    
    // 2
    if ([dic objectForKey:XXJname] == nil ||
        [dic objectForKey:XXJname] == [NSNull null])
    {
        self.name =  @"";
    }
    else
    {
        self.name = dic[XXJname];
    }
    
    // 3
    if ([dic objectForKey:XXJShopID] == nil ||
        [dic objectForKey:XXJShopID] == [NSNull null])
    {
        self.shopID =  @"";
    }
    else
    {
        self.shopID = dic[XXJShopID];
    }
    
    
    //4
    // 3
    if ([dic objectForKey:XXJShopImage] == nil ||
        [dic objectForKey:XXJShopImage] == [NSNull null])
    {
        self.image =  @"";
    }
    else
    {
        self.image = dic[XXJShopImage];
    }
    
}
@end
