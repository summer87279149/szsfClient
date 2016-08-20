//
//  TabelCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJname         @""
#define XXJdistance     @""
#import "TabelCellModel.h"

@implementation TabelCellModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    // tou xiang
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    // ming zi
    if ([dic objectForKey:XXJdistance]==nil||[dic objectForKey:XXJdistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJdistance]];
    }
    

}
@end
