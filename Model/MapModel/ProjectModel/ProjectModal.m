//
//  ProjectModal.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJIsToMyHome                               @"isshangmen"
#define XXJprojectID                                @"pid"
#define XXJimageURLArray                            @"projbanner"
#define XXJprojectName                              @"projectname"
#define XXJeffect                                   @"effect"
#define XXJprice                                    @"price"
#define XXJtime                                     @"time"
#define XXJchooseNumber                             @"selectnum"
#define XXJcommentsNumber                           @"remarks"
#define XXJgoodComments                             @"goodremarkrate"
#define XXJtechWorkYears                            @"years"
#define XXJserviceInfo                              @"serviceinst"
#define XXJserviceKnow                              @"notice"
#define XXJaimAt                                    @"tobodypart"
#define XXJTechID                                   @"tid"
#define XXJTechName                                 @"tname"
#define XXJTechheadimgurl                           @"headimgurl"
#define XXJTechAuthenticationImage                  @"isstar"
#define XXJTechskill                                @"cate"
#define XXJTechserviceTimes                         @"orderqty"
#import "ProjectModal.h"

@implementation ProjectModal


- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:XXJIsToMyHome] == nil ||
        [dic objectForKey:XXJIsToMyHome] == [NSNull null])
    {
        self.isToMyHome = @"0";
    }
    else
    {
        self.isToMyHome = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJIsToMyHome] ];
    }
    // 1
    if ([dic objectForKey:XXJprojectID] == nil ||
        [dic objectForKey:XXJprojectID] == [NSNull null])
    {
        self.projectID = @"";
    }
    else
    {
        self.projectID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprojectID] ];
    }
    // 2
    if ([dic objectForKey:XXJimageURLArray] == nil ||
        [dic objectForKey:XXJimageURLArray] == [NSNull null])
    {
        self.imageURLArray = nil;
    }
    else
    {
        if ([dic[XXJimageURLArray] isKindOfClass:[NSArray class]]) {
            self.imageURLArray = [NSArray arrayWithArray:dic[XXJimageURLArray]];
        }
    }
    
    //3
    if ([dic objectForKey:XXJprojectName] == nil ||
        [dic objectForKey:XXJprojectName] == [NSNull null])
    {
        self.projectName = @"";
    }
    else
    {
        self.projectName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprojectName]];
    }
    
    //4
    if ([dic objectForKey:XXJeffect] == nil ||
        [dic objectForKey:XXJeffect] == [NSNull null])
    {
        self.effect = @"";
    }
    else
    {
        self.effect = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJeffect]];
    }
    //5
    if ([dic objectForKey:XXJprice] == nil ||
        [dic objectForKey:XXJprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprice]];
    }
    
    //6
    if ([dic objectForKey:XXJtime] == nil ||
        [dic objectForKey:XXJtime] == [NSNull null])
    {
        self.time = @"";
    }
    else
    {
        self.time = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJtime]];
    }
    //7
    if ([dic objectForKey:XXJchooseNumber] == nil ||
        [dic objectForKey:XXJchooseNumber] == [NSNull null])
    {
        self.chooseNumber = @"";
    }
    else
    {
        self.chooseNumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJchooseNumber]];
    }
    
    //8
   
    if ([dic objectForKey:XXJcommentsNumber] == nil ||
        [dic objectForKey:XXJcommentsNumber] == [NSNull null])
    {
        self.commentsNumber = @"";
    }
    else
    {
        self.commentsNumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJcommentsNumber]];
    }

    //9
    if ([dic objectForKey:XXJgoodComments] == nil ||
        [dic objectForKey:XXJgoodComments] == [NSNull null])
    {
        self.goodComments = @"";
    }
    else
    {
        self.goodComments = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJgoodComments]];
    }

    //10
    
    
  

    
    //11

    if ([dic objectForKey:XXJserviceInfo] == nil ||
        [dic objectForKey:XXJserviceInfo] == [NSNull null])
    {
        self.serviceInfo = nil;
    }
    else
    {
        self.serviceInfo = [dic objectForKey:XXJserviceInfo];
    }
    //12
    
    if ([dic objectForKey:XXJserviceKnow] == nil ||
        [dic objectForKey:XXJserviceKnow] == [NSNull null])
    {
        self.serviceKnow = nil;
    }
    else
    {
        self.serviceKnow = [dic objectForKey:XXJserviceKnow];
    }
    //13
    
    if ([dic objectForKey:XXJaimAt] == nil ||
        [dic objectForKey:XXJaimAt] == [NSNull null])
    {
        self.aimAt = nil;
    }
    else
    {
        self.aimAt = [dic objectForKey:XXJaimAt];
    }
    //技师id
    if ([dic objectForKey:XXJTechID] == nil ||
        [dic objectForKey:XXJTechID] == [NSNull null])
    {
        self.technicianID = nil;
    }
    else
    {
        self.technicianID = [dic objectForKey:XXJTechID];
    }
    //技师名字
    if ([dic objectForKey:XXJTechName] == nil ||
        [dic objectForKey:XXJTechName] == [NSNull null])
    {
        self.name = nil;
    }
    else
    {
        self.name = [dic objectForKey:XXJTechName];
    }
    //技师头像
    if ([dic objectForKey:XXJTechheadimgurl] == nil ||
        [dic objectForKey:XXJTechheadimgurl] == [NSNull null])
    {
        self.headimgurl = nil;
    }
    else
    {
        self.headimgurl = [dic objectForKey:XXJTechheadimgurl];
    }
    //是否有名师认证图标
    if ([dic objectForKey:XXJTechAuthenticationImage] == nil ||
        [dic objectForKey:XXJTechAuthenticationImage] == [NSNull null])
    {
        self.AuthenticationImage = nil;
    }
    else
    {
        self.AuthenticationImage = [dic objectForKey:XXJTechAuthenticationImage];
    }
    //技能
    if ([dic objectForKey:XXJTechskill] == nil ||
        [dic objectForKey:XXJTechskill] == [NSNull null])
    {
        self.skill = nil;
    }
    else
    {
        self.skill = [dic objectForKey:XXJTechskill];
    }
    //服务次数
    if ([dic objectForKey:XXJTechserviceTimes] == nil ||
        [dic objectForKey:XXJTechserviceTimes] == [NSNull null])
    {
        self.serviceTimes = nil;
    }
    else
    {
        self.serviceTimes = [dic objectForKey:XXJTechserviceTimes];
    }
    //技师工作年限
    if ([dic objectForKey:XXJtechWorkYears] == nil ||
        [dic objectForKey:XXJtechWorkYears] == [NSNull null])
    {
        self.techWorkYears = nil;
    }
    else
    {
        self.techWorkYears = [dic objectForKey:XXJtechWorkYears];
    }
    
    
}

@end
