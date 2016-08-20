//
//  HomeCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJdistance                              @""
#define XXJname                                    @""

#import "HomeCellModel.h"

@implementation HomeCellModel
- (void)parseFromDictionary:(NSDictionary *)dic
{
    
    if ([dic objectForKey:XXJdistance]==nil||[dic objectForKey:XXJdistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJdistance]];
    }
    
    
    
    // 2
    if ([dic objectForKey:XXJname] == nil ||
        [dic objectForKey:XXJname] == [NSNull null])
    {
        self.name =  @"";
    }
    else
    {
        self.name = dic[XXJname];
    }

    
}
@end
