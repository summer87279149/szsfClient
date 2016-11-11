//
//  MyCollectionModel.m
//  foot
//
//  Created by Admin on 16/11/4.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MyCollectionModel.h"
#define XXJShopID                               @"sid"
#define XXJimageUrl                             @"images"
#define XXJname                                 @"shopname"
#define XXdescrip                               @"description"
#define XXprice                                 @"avgprice"
#define XXstar                                  @"score"
#define XXnear                                  @"distance"

@implementation MyCollectionModel




- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:XXJShopID]==nil||[dic objectForKey:XXJShopID] == [NSNull null])
    {
        self.shopID = @"";
    }
    else
    {
        self.shopID = [NSString stringWithFormat:@"%d",[[dic objectForKey:XXJShopID] intValue]];
    }
    
    
    
    
    
    
    //tu pian
    if ([dic objectForKey:XXJimageUrl]==nil||[dic objectForKey:XXJimageUrl] == [NSNull null])
    {
        self.imageUrl = @"";
    }
    else
    {
        self.imageUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageUrl]];
    }
    // ming cheng
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    //dianpu miaoshu
    
    if ([dic objectForKey:XXdescrip]==nil||[dic objectForKey:XXdescrip] == [NSNull null])
    {
        self.descrip = @"";
    }
    else
    {
        self.descrip = [NSString stringWithFormat:@"%@",[dic objectForKey:XXdescrip]];
    }
    
    
    //junjia
    if ([dic objectForKey:XXprice]==nil||[dic objectForKey:XXprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXprice]];
    }
    //ping fen
    if ([dic objectForKey:XXstar]==nil||[dic objectForKey:XXstar] == [NSNull null])
    {
        self.star = 5.0;
    }
    else
    {
        NSString *str = [NSString stringWithFormat:@"%.1f", [[dic objectForKey:XXstar]floatValue]];
        self.star = [str floatValue];
    }
    
    //juli
    if ([dic objectForKey:XXnear]==nil||[dic objectForKey:XXnear] == [NSNull null])
    {
        self.near = @"";
    }
    else
    {
        self.near = [NSString stringWithFormat:@"%.1f",[[dic objectForKey:XXnear]floatValue]];
    }
    
}
@end
