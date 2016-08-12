//
//  MapMode.m
//  HJWJJ
//
//  Created by mingchen macos on 15/5/25.
//  Copyright (c) 2015年 mingchen macos. All rights reserved.
//

#import "MapMode.h"

#define JSProjectId                      @"id"
#define JSProjectName                    @"shopname"
#define JSPointX                         @"longitude"
#define JSPointY                         @"latitude"
#define JSAddress                        @"address"
#define JSDistance                       @"distance"
#define JSRecordId                       @"recordId"
#define JSRecordDate                     @"recordDate"
#define JSTitle                          @"title"
#define JSHtmlStr                        @"htmlStr"
#define JSRecordPersonName               @"recordPersonName"
#define JSArea                           @"area"
#define JSStartTime                      @"startTime"
#define JSImageUrl                       @"images"



@implementation MapMode
@synthesize projectName,projectId,pointX,pointY,address,distance,htmlStr,recordPersonName,title,recordId,recordDate,startTime,area,imageUrl;

- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:JSProjectId] == nil ||
        [dic objectForKey:JSProjectId] == [NSNull null])
    {
        self.projectId = @"";
    }
    else
    {
        self.projectId = [NSString stringWithFormat:@"%@",[dic objectForKey:JSProjectId]];
    }
    
    if ([dic objectForKey:JSProjectName] == nil ||
        [dic objectForKey:JSProjectName] == [NSNull null])
    {
        self.projectName = @"";
    }
    else
    {
        self.projectName = [NSString stringWithFormat:@"%@",[dic objectForKey:JSProjectName]];
    }
    
    if ([dic objectForKey:JSPointX] == nil ||
        [dic objectForKey:JSPointX] == [NSNull null])
    {
        self.pointX = @"";
    }
    else
    {
        self.pointX = [NSString stringWithFormat:@"%@",[dic objectForKey:JSPointX]];
    }
    
    if ([dic objectForKey:JSPointY] == nil ||
        [dic objectForKey:JSPointY] == [NSNull null])
    {
        self.pointY = @"";
    }
    else
    {
        self.pointY = [NSString stringWithFormat:@"%@",[dic objectForKey:JSPointY]];
    }
    
    if ([dic objectForKey:JSAddress] == nil ||
        [dic objectForKey:JSAddress] == [NSNull null])
    {
        self.address = @"";
    }
    else
    {
        self.address = [NSString stringWithFormat:@"%@",[dic objectForKey:JSAddress]];
    }
    
    if ([dic objectForKey:JSDistance] == nil ||
        [dic objectForKey:JSDistance] == [NSNull null])
    {
        self.distance = @"";
    }
    else
    {
        self.distance = [NSString stringWithFormat:@"%@",[dic objectForKey:JSDistance]];
    }
    
    if ([dic objectForKey:JSTitle] == nil ||
        [dic objectForKey:JSTitle] == [NSNull null])
    {
        self.title = @"";
    }
    else
    {
        self.title = [NSString stringWithFormat:@"%@",[dic objectForKey:JSTitle]];
    }
    
    if ([dic objectForKey:JSRecordId] == nil ||
        [dic objectForKey:JSRecordId] == [NSNull null])
    {
        self.recordId = @"";
    }
    else
    {
        self.recordId = [NSString stringWithFormat:@"%@",[dic objectForKey:JSRecordId]];
    }
    
    if ([dic objectForKey:JSRecordDate] == nil ||
        [dic objectForKey:JSRecordDate] == [NSNull null])
    {
        self.recordDate = @"";
    }
    else
    {
        self.recordDate = [NSString stringWithFormat:@"%@",[dic objectForKey:JSRecordDate]];
    }

    
    if ([dic objectForKey:JSHtmlStr] == nil ||
        [dic objectForKey:JSHtmlStr] == [NSNull null])
    {
        self.htmlStr = @"";
    }
    else
    {
        self.htmlStr = [NSString stringWithFormat:@"%@",[dic objectForKey:JSHtmlStr]];
    }
    
    if ([dic objectForKey:JSRecordPersonName] == nil ||
        [dic objectForKey:JSRecordPersonName] == [NSNull null])
    {
        self.recordPersonName = @"";
    }
    else
    {
        self.recordPersonName = [NSString stringWithFormat:@"%@",[dic objectForKey:JSRecordPersonName]];
    }
    
    if ([dic objectForKey:JSArea] == nil ||
        [dic objectForKey:JSArea] == [NSNull null])
    {
        self.area = @"";
    }
    else
    {
        self.area = [NSString stringWithFormat:@"%@",[dic objectForKey:JSArea]];
    }
    
    if ([dic objectForKey:JSStartTime] == nil ||
        [dic objectForKey:JSStartTime] == [NSNull null])
    {
        self.startTime = @"";
    }
    else
    {
        self.startTime = [NSString stringWithFormat:@"%@",[dic objectForKey:JSStartTime]];
    }
    
    if ([dic objectForKey:JSImageUrl] == nil ||
        [dic objectForKey:JSImageUrl] == [NSNull null])
    {
        self.imageUrl = @"";
    }
    else
    {
        self.imageUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:JSImageUrl]];
    }
}
@end
