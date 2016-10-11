//
//  TabelCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJname         @"projectname"
#define XXJdistance     @"technum"
#define XXJPID          @"pid"
#import "TabelCellModel.h"

@implementation TabelCellModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    // tou xiang
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"无";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    // ming zi
    if ([dic objectForKey:XXJdistance]==nil||[dic objectForKey:XXJdistance] == [NSNull null])
    {
        self.distance = @"0";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%d",(int)[dic objectForKey:XXJdistance]];
    }
    
    if ([dic objectForKey:XXJPID]==nil||[dic objectForKey:XXJPID] == [NSNull null])
    {
        self.pid = @"0";
    }
    else
    {
        self.pid = [NSString stringWithFormat:@"%d",(int)[dic objectForKey:XXJPID]];
    }
    
    
    
    
}
@end
