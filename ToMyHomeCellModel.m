//
//  ToMyHomeCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJimageviewUrl                 @""
#define XXJname                 @""
#define XXJgrade                 @""
#define XXJorderNumber                 @""
#define XXJdistance                 @""
#define XXJtext                 @""
#define XXJproject                 @""
#define XXJbelongTo                 @""


#import "ToMyHomeCellModel.h"

@implementation ToMyHomeCellModel
- (void)parseFromDictionary:(NSDictionary *)dic
{
    // tou xiang
    if ([dic objectForKey:XXJimageviewUrl]==nil||[dic objectForKey:XXJimageviewUrl] == [NSNull null])
    {
        self.imageviewUrl = @"";
    }
    else
    {
        self.imageviewUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageviewUrl]];
    }
    // ming zi
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    
    //pingfen
    
    if ([dic objectForKey:XXJgrade]==nil||[dic objectForKey:XXJgrade] == [NSNull null])
    {
        self.grade = @"";
    }
    else
    {
        self.grade = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJgrade]];
    }
    //danshu
    if ([dic objectForKey:XXJorderNumber]==nil||[dic objectForKey:XXJorderNumber] == [NSNull null])
    {
        self.orderNumber = @"";
    }
    else
    {
        self.orderNumber = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJorderNumber]];
    }
    
    //ju li
    
    if ([dic objectForKey:XXJdistance]==nil||[dic objectForKey:XXJdistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJdistance]];
    }
    
    if ([dic objectForKey:XXJtext]==nil||[dic objectForKey:XXJtext] == [NSNull null])
    {
        self.text = @"";
    }
    else
    {
        self.text = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJtext]];
    }
    
    if ([dic objectForKey:XXJproject]==nil||[dic objectForKey:XXJproject] == [NSNull null])
    {
        self.project = @"";
    }
    else
    {
        self.project = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJproject]];
    }
    
    if ([dic objectForKey:XXJbelongTo]==nil||[dic objectForKey:XXJbelongTo] == [NSNull null])
    {
        self.belongTo = @"";
    }
    else
    {
        self.belongTo = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJbelongTo]];
    }
    
    
}
@end