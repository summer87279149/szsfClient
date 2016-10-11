//
//  MyFocusCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJTechnicianID                                  @"tid"
#define XXJportrait                     @"headimgurl"
#define XXJtechName                     @"tname"
#define XXJAuthenticationImage          @"isstar"
#define XXJskill                        @"cate"
#define XXJserviceTimes                 @"orderqty"
#define XXJTechWorkYears                               @"years"
#import "MyFocusCellModel.h"

@implementation MyFocusCellModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    if ([dic objectForKey:XXJTechnicianID] == nil ||
        [dic objectForKey:XXJTechnicianID] == [NSNull null])
    {
        self.technicianID = @"";
    }
    else
    {
        self.technicianID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTechnicianID]];
    }
    
    if ([dic objectForKey:XXJportrait]==nil||[dic objectForKey:XXJportrait] == [NSNull null])
    {
        self.portrait = @"";
    }
    else
    {
        self.portrait = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJportrait]];
    }
    // ming zi
    if ([dic objectForKey:XXJtechName]==nil||[dic objectForKey:XXJtechName] == [NSNull null])
    {
        self.techName = @"";
    }
    else
    {
        self.techName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJtechName]];
    }
    if ([dic objectForKey:XXJAuthenticationImage]==nil||[dic objectForKey:XXJAuthenticationImage] == [NSNull null])
    {
        self.AuthenticationImage = @"";
    }
    else
    {
        self.AuthenticationImage = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJAuthenticationImage]];
    }
    // ming zi
    if ([dic objectForKey:XXJskill]==nil||[dic objectForKey:XXJskill] == [NSNull null])
    {
        self.skill = @"";
    }
    else
    {
        self.skill = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJskill]];
    }
    if ([dic objectForKey:XXJserviceTimes]==nil||[dic objectForKey:XXJserviceTimes] == [NSNull null])
    {
        self.serviceTimes = @"";
    }
    else
    {
        self.serviceTimes = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJserviceTimes]];
    }
    if ([dic objectForKey:XXJTechWorkYears] == nil ||
        [dic objectForKey:XXJTechWorkYears] == [NSNull null])
    {
        self.years = @"";
    }
    else
    {
        self.years = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTechWorkYears]];
    }

}
@end
