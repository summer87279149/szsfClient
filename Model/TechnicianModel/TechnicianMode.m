//
//  TechnicianMode.m
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "TechnicianMode.h"

#define XXJName                                     @"name"
#define XXJType                                     @"catename"
#define XXJAge                                      @"age"
#define XXJScore                                    @"score"
#define XXJShopName                                 @"shopname"
#define XXJTechnicianID                             @"id"
#define XXJOrderqty                                 @"orderqty"
#define XXJHeadimgurl                               @"headimgurl"
#define XXJSex                                      @"sex"
#define XXJDistance                                 @"distance"



@implementation TechnicianMode
@synthesize name,type,age,score,shopName,technicianID,orderqty,headimgurl,sex,distance;

- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:XXJSex] == nil ||
        [dic objectForKey:XXJSex] == [NSNull null])
    {
        self.sex = @"";
    }
    else
    {
        self.sex = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJSex]];
    }
    
    if ([dic objectForKey:XXJDistance] == nil ||
        [dic objectForKey:XXJDistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJDistance]];
    }
    
    if ([dic objectForKey:XXJHeadimgurl] == nil ||
        [dic objectForKey:XXJHeadimgurl] == [NSNull null])
    {
        self.headimgurl = @"";
    }
    else
    {
        self.headimgurl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJHeadimgurl]];
    }
    
    if ([dic objectForKey:XXJOrderqty] == nil ||
        [dic objectForKey:XXJOrderqty] == [NSNull null])
    {
        self.orderqty = @"";
    }
    else
    {
        self.orderqty = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJOrderqty]];
    }
    
    if ([dic objectForKey:XXJTechnicianID] == nil ||
        [dic objectForKey:XXJTechnicianID] == [NSNull null])
    {
        self.technicianID = @"";
    }
    else
    {
        self.technicianID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTechnicianID]];
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
    
    if ([dic objectForKey:XXJScore] == nil ||
        [dic objectForKey:XXJScore] == [NSNull null])
    {
        self.score = @"";
    }
    else
    {
        self.score = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJScore]];
    }
    
    if ([dic objectForKey:XXJAge] == nil ||
        [dic objectForKey:XXJAge] == [NSNull null])
    {
        self.age = @"";
    }
    else
    {
        self.age = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJAge]];
    }
    
    if ([dic objectForKey:XXJType] == nil ||
        [dic objectForKey:XXJType] == [NSNull null])
    {
        self.type = @"";
    }
    else
    {
        self.type = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJType]];
    }
    
    if ([dic objectForKey:XXJName] == nil ||
        [dic objectForKey:XXJName] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJName]];
    }
}
@end
