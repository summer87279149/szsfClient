//
//  ProjectModel.m
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ProjectModel.h"

#define XXJImageUrl                                 @"logo"
#define XXJProjectName                              @"projectname"
#define XXJProjectID                                @"id"
#define XXJServices                                 @"services"
#define XXJPrice                                    @"price"

@implementation ProjectModel
@synthesize projectID,imageURL,projectName,services,price;

- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:XXJPrice] == nil ||
        [dic objectForKey:XXJPrice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJPrice]];
    }
    
    if ([dic objectForKey:XXJImageUrl] == nil ||
        [dic objectForKey:XXJImageUrl] == [NSNull null])
    {
        self.imageURL = @"";
    }
    else
    {
        self.imageURL = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJImageUrl]];
    }
    
    if ([dic objectForKey:XXJProjectName] == nil ||
        [dic objectForKey:XXJProjectName] == [NSNull null])
    {
        self.projectName = @"";
    }
    else
    {
        self.projectName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJProjectName]];
    }
    
    if ([dic objectForKey:XXJProjectID] == nil ||
        [dic objectForKey:XXJProjectID] == [NSNull null])
    {
        self.projectID = @"";
    }
    else
    {
        self.projectID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJProjectID]];
    }
    
    if ([dic objectForKey:XXJServices] == nil ||
        [dic objectForKey:XXJServices] == [NSNull null])
    {
        self.services = @"";
    }
    else
    {
        self.services = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJProjectID]];
    }
}
@end
