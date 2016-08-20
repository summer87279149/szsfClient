//
//  ProjectModal.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#define XXJprojectID                                @"banner"
#define XXJimageURLArray                            @"name"
#define XXJprojectName                              @"id"
#define XXJeffect                                   @"url"
#define XXJprice                                    @""
#define XXJtime                                     @""
#define XXJchooseNumber                             @""
#define XXJcommentsNumber                           @""
#define XXJgoodComments                             @""
#define XXJtechModal                                @""
#define XXJserviceInfo                              @""
#define XXJserviceKnow                              @""
#define XXJaimAt                                    @""


#import "ProjectModal.h"

@implementation ProjectModal


- (void)parseFromDictionary:(NSDictionary *)dic
{
    // 1
    if ([dic objectForKey:XXJprojectID]==nil||[dic objectForKey:XXJprojectID] == [NSNull null]) {self.projectID = @"";}else{
        self.projectID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprojectID]];}
    // 2
    if ([dic objectForKey:XXJimageURLArray] == nil ||
        [dic objectForKey:XXJimageURLArray] == [NSNull null])
    {
        self.imageURLArray = nil;
    }
    else
    {
        self.imageURLArray = dic[XXJimageURLArray];
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
    
    
}

@end
