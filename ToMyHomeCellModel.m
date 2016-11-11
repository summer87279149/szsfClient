//
//  ToMyHomeCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJTechID                       @"tid"
#define XXJimageviewUrl                 @"headimgurl"
#define XXJname                         @"tname"
#define XXJgrade                        @"tscore"
#define XXJorderNumber                  @"finishedorders"
#define XXJdistance                     @"distance"
#define XXJtext                         @"instruction"
#define XXJproject                      @"cate"
#define XXJbelongTo                     @"shopname"


#import "ToMyHomeCellModel.h"

@implementation ToMyHomeCellModel
- (void)parseFromDictionary:(NSDictionary *)dic
{
    // 技师id
    if ([dic objectForKey:XXJTechID]==nil||[dic objectForKey:XXJTechID] == [NSNull null])
    {
        self.techID = @"";
    }
    else
    {
        self.techID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJTechID]];
    }
    
    
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
        self.grade = [NSString stringWithFormat:@"%.1f",[[dic objectForKey:XXJgrade] floatValue]];
        if ([[dic objectForKey:XXJgrade] floatValue] == 0.0) {
            self.grade = @"0";
        }
    }
    //danshu
    if ([dic objectForKey:XXJorderNumber]==nil||[dic objectForKey:XXJorderNumber] == [NSNull null])
    {
        self.orderNumber = @"";
    }
    else
    {
        self.orderNumber = [NSString stringWithFormat:@"%d",[[dic objectForKey:XXJorderNumber]intValue]];
    }
    
    //ju li
    
    if ([dic objectForKey:XXJdistance]==nil||[dic objectForKey:XXJdistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%.1f",[[dic objectForKey:XXJdistance]floatValue]];
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
