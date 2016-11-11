//
//  TabelCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJname         @"projectname"
#define XXJnumber     @"technum"
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
    if ([dic objectForKey:XXJnumber]==nil||[dic objectForKey:XXJnumber] == [NSNull null])
    {
        self.number = @"0";
    }
    else
    {
        self.number = [NSString stringWithFormat:@"%d",[[dic objectForKey:XXJnumber] intValue]];
    }
    
    if ([dic objectForKey:XXJPID]==nil||[dic objectForKey:XXJPID] == [NSNull null])
    {
        self.pid = @"0";
    }
    else
    {
        self.pid = [NSString stringWithFormat:@"%d",[[dic objectForKey:XXJPID] intValue]];
    }
    
    
    
    
}
@end
