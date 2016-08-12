//
//  ShopMode.m
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ShopMode.h"

#define XXJShopAddress                                  @"address"
#define XXJShopID                                       @"id"
#define XXJShopImagesURL                                @"images"
#define XXJLatitude                                     @"latitude"
#define XXJLongitude                                    @"longitude"
#define XXJShopInfo                                     @"info"
#define XXJShopOrderqty                                 @"orderqty"
#define XXJShopName                                     @"shopname"
#define XXJShopPhone                                    @"tel"
#define XXJShopDistance                                 @"distance"
#define XXJShopFloorprice                               @"floorprice"
#define XXJShopScore                                    @"score"

@implementation ShopMode
@synthesize shopAddress,shopID,shopImagesURL,shopInfo,latitude,longitude,shopOrderqty,shopName,shopPhone,shopDistance,shopFloorprice,shopScore;

- (void)parseFromDictionary:(NSDictionary *)dic
{

    if ([dic objectForKey:XXJShopScore] == nil ||
        [dic objectForKey:XXJShopScore] == [NSNull null])
    {
        self.shopScore = @"";
    }
    else
    {
        self.shopScore = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopScore]];
    }
    
    if ([dic objectForKey:XXJShopFloorprice] == nil ||
        [dic objectForKey:XXJShopFloorprice] == [NSNull null])
    {
        self.shopFloorprice = @"";
    }
    else
    {
        self.shopFloorprice = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopFloorprice]];
    }
    
    if ([dic objectForKey:XXJShopDistance] == nil ||
        [dic objectForKey:XXJShopDistance] == [NSNull null])
    {
        self.shopDistance = @"";
    }
    else
    {
        self.shopDistance = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopDistance]];
    }
    
    if ([dic objectForKey:XXJShopPhone] == nil ||
        [dic objectForKey:XXJShopPhone] == [NSNull null])
    {
        self.shopPhone = @"";
    }
    else
    {
        self.shopPhone = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopPhone]];
    }
    
    if ([dic objectForKey:XXJShopName] == nil ||
        [dic objectForKey:XXJShopName] == [NSNull null])
    {
        self.shopName = @"";
    }
    else
    {
        self.shopName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopName]];
    }
    
    if ([dic objectForKey:XXJShopOrderqty] == nil ||
        [dic objectForKey:XXJShopOrderqty] == [NSNull null])
    {
        self.shopOrderqty = @"";
    }
    else
    {
        self.shopOrderqty = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopOrderqty]];
    }
    
    if ([dic objectForKey:XXJShopInfo] == nil ||
        [dic objectForKey:XXJShopInfo] == [NSNull null])
    {
        self.shopInfo = @"";
    }
    else
    {
        self.shopInfo = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopInfo]];
    }
    
    if ([dic objectForKey:XXJLongitude] == nil ||
        [dic objectForKey:XXJLongitude] == [NSNull null])
    {
        self.longitude = @"";
    }
    else
    {
        self.longitude = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJLongitude]];
    }
    
    if ([dic objectForKey:XXJLatitude] == nil ||
        [dic objectForKey:XXJLatitude] == [NSNull null])
    {
        self.latitude = @"";
    }
    else
    {
        self.latitude = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJLatitude]];
    }
    
    if ([dic objectForKey:XXJShopImagesURL] == nil ||
        [dic objectForKey:XXJShopImagesURL] == [NSNull null])
    {
        self.shopImagesURL = @"";
    }
    else
    {
        self.shopImagesURL = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopImagesURL]];
    }
    
    if ([dic objectForKey:XXJShopID] == nil ||
        [dic objectForKey:XXJShopID] == [NSNull null])
    {
        self.shopID = @"";
    }
    else
    {
        self.shopID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopID]];
    }
    
    if ([dic objectForKey:XXJShopAddress] == nil ||
        [dic objectForKey:XXJShopAddress] == [NSNull null])
    {
        self.shopAddress = @"";
    }
    else
    {
        self.shopAddress = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopAddress]];
    }
}
@end
