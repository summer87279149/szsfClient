//
//  ShopCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJimage                @""
#define XXJname                 @""
#define XXJprice                @""
#define XXJchooseNumber         @""
#define XXJtime                 @""

#import "ShopCellModel.h"

@implementation ShopCellModel

-(void)parseFromDictionary:(NSDictionary *)dic{
    //
    if ([dic objectForKey:XXJimage] == nil ||
        [dic objectForKey:XXJimage] == [NSNull null])
    {
        self.image = @"";
    }
    else
    {
        self.image = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimage]];
    }
    
    //
    if ([dic objectForKey:XXJname] == nil ||
        [dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    
    //
    if ([dic objectForKey:XXJprice] == nil ||
        [dic objectForKey:XXJprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprice]];
    }
    
    //
    if ([dic objectForKey:XXJchooseNumber] == nil ||
        [dic objectForKey:XXJchooseNumber] == [NSNull null])
    {
        self.chooseNumber = @"";
    }
    else
    {
        self.chooseNumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJchooseNumber]];
    }
    
    //
    if ([dic objectForKey:XXJtime] == nil ||
        [dic objectForKey:XXJtime] == [NSNull null])
    {
        self.time = @"";
    }
    else
    {
        self.time = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJtime]];
    }
    
    
    
}
@end
