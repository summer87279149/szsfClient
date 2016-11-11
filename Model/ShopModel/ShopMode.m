//
//  ShopMode.m
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ShopMode.h"

#define XXJShopID                                       @"sid"
#define XXJShopImagesURL                                @"images"
#define XXJShopName                                     @"shopname"
#define XXJShopAddress                                  @"address"
#define XXJLatitude                                     @"latitude"
#define XXJLongitude                                    @"longitude"
#define XXJShopPhone                                    @"tel"
#define XXJShopOrderqty                                 @"selectnum"
#define XXJcommentsNumber                               @"remarks"
#define XXJgoodCommentRare                              @"goodremarkrate"
#define XXJDistance                                     @"distance"



@implementation ShopMode

- (void)parseFromDictionary:(NSDictionary *)dic
{
 
    
    if ([dic objectForKey:XXJShopID] == nil ||
        [dic objectForKey:XXJShopID] == [NSNull null])
    {
        self.shopID = @"";
    }
    else
    {
        self.shopID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopID]];
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
    
    
    if ([dic objectForKey:XXJShopName] == nil ||
        [dic objectForKey:XXJShopName] == [NSNull null])
    {
        self.shopName = @"";
    }
    else
    {
        self.shopName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopName]];
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
    
    
    
    
    if ([dic objectForKey:XXJLatitude] == nil ||
        [dic objectForKey:XXJLatitude] == [NSNull null])
    {
        self.latitude = @"";
    }
    else
    {
        self.latitude = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJLatitude]];
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
    
    
    if ([dic objectForKey:XXJShopPhone] == nil ||
        [dic objectForKey:XXJShopPhone] == [NSNull null])
    {
        self.shopPhone = @"";
    }
    else
    {
        self.shopPhone = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJShopPhone]];
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
    
    
    if ([dic objectForKey:XXJcommentsNumber] == nil ||
        [dic objectForKey:XXJcommentsNumber] == [NSNull null])
    {
        self.commentsNumber = @"";
    }
    else
    {
        self.commentsNumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJcommentsNumber]];
    }
    
    
    
    
    if ([dic objectForKey:XXJgoodCommentRare] == nil ||
        [dic objectForKey:XXJgoodCommentRare] == [NSNull null])
    {
        self.goodCommentRare = @"";
    }
    else
    {
        self.goodCommentRare = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJgoodCommentRare]];
    }
    
    
   
    if ([dic objectForKey:XXJDistance] == nil ||
        [dic objectForKey:XXJDistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        
        self.distance = [NSString stringWithFormat:@"%.1f",[[dic objectForKey:XXJDistance]floatValue]];
    }
   
    
    
    
    
    
   
    
   
    
    
   
    
    
}
@end
