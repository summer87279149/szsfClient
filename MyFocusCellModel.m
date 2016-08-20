//
//  MyFocusCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJportrait                     @""
#define XXJtechName                     @""
#define XXJAuthenticationImage          @""
#define XXJskill                        @""
#define XXJserviceTimes                 @""
#import "MyFocusCellModel.h"

@implementation MyFocusCellModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    
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
   

}
@end
