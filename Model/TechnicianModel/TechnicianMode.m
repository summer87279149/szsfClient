//
//  TechnicianMode.m
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "TechnicianMode.h"

#define XXJTechnicianID                                  @"id"
#define XXJName                                          @"name"
#define XXJheadimgurl                                    @"age"
#define XXJAuthenticationImage                           @"score"
#define XXJskill                                         @"shopname"
#define XXJserviceTimes                                  @"orderqty"
#define XXJisFocus                                       @"headimgurl"
#define XXJtechIntroduction                              @"sex"
#define XXJcommentsNumber                                @"distance"
#define XXJgoodCommentRare                               @""


@implementation TechnicianMode

- (void)parseFromDictionary:(NSDictionary *)dic
{
    
    if ([dic objectForKey:XXJTechnicianID] == nil ||
        [dic objectForKey:XXJTechnicianID] == [NSNull null])
    {
        self.technicianID = @"";
    }
    else
    {
        self.technicianID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTechnicianID]];
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
    
    
    
    if ([dic objectForKey:XXJheadimgurl] == nil ||
        [dic objectForKey:XXJheadimgurl] == [NSNull null])
    {
        self.headimgurl = @"";
    }
    else
    {
        self.headimgurl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJheadimgurl]];
    }
    
    
    
    if ([dic objectForKey:XXJAuthenticationImage] == nil ||
        [dic objectForKey:XXJAuthenticationImage] == [NSNull null])
    {
        self.AuthenticationImage = @"";
    }
    else
    {
        self.AuthenticationImage = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJAuthenticationImage]];
    }
    
    
    
    if ([dic objectForKey:XXJskill] == nil ||
        [dic objectForKey:XXJskill] == [NSNull null])
    {
        self.skill = @"";
    }
    else
    {
        self.skill = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJskill]];
    }
    
    
    
    if ([dic objectForKey:XXJserviceTimes] == nil ||
        [dic objectForKey:XXJserviceTimes] == [NSNull null])
    {
        self.serviceTimes = @"";
    }
    else
    {
        self.serviceTimes = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJserviceTimes]];
    }
    
    
    
    if ([dic objectForKey:XXJisFocus] == nil ||
        [dic objectForKey:XXJisFocus] == [NSNull null])
    {
        self.isFocus = @"";
    }
    else
    {
        self.isFocus = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJisFocus]];
    }
    
    
    
    
    if ([dic objectForKey:XXJtechIntroduction] == nil ||
        [dic objectForKey:XXJtechIntroduction] == [NSNull null])
    {
        self.techIntroduction = @"";
    }
    else
    {
        self.techIntroduction = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJtechIntroduction]];
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
    
    
}
@end
