//
//  MyMessageModel.m
//  foot
//
//  Created by Admin on 16/10/14.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJTime         @""
#define XXJContent            @""


#import "MyMessageModel.h"

@implementation MyMessageModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    // tu pian
    if ([dic objectForKey:XXJTime]==nil||[dic objectForKey:XXJTime] == [NSNull null])
    {
        self.time = @"";
    }
    else
    {
        self.time = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTime]];
    }
    
    if ([dic objectForKey:XXJContent]==nil||[dic objectForKey:XXJContent] == [NSNull null])
    {
        self.content = @"";
    }
    else
    {
        self.content = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJContent]];
    }
}
@end
