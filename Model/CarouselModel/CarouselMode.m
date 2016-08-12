//
//  CarouselMode.m
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CarouselMode.h"
#define XXJImageUrl                             @"banner"
#define XXJImageName                            @"name"
#define XXJImageID                              @"id"
#define XXJURL                                  @"url"


@implementation CarouselMode
@synthesize imageUrl,imageName,imageID,url;

- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:XXJImageUrl] == nil ||
        [dic objectForKey:XXJImageUrl] == [NSNull null])
    {
        self.imageUrl = @"";
    }
    else
    {
        self.imageUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJImageUrl]];
    }
    
    if ([dic objectForKey:XXJImageName] == nil ||
        [dic objectForKey:XXJImageName] == [NSNull null])
    {
        self.imageName = @"";
    }
    else
    {
        self.imageName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJImageName]];
    }
    
    if ([dic objectForKey:XXJImageID] == nil ||
        [dic objectForKey:XXJImageID] == [NSNull null])
    {
        self.imageID = @"";
    }
    else
    {
        self.imageID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJImageID]];
    }
    
    if ([dic objectForKey:XXJURL] == nil ||
        [dic objectForKey:XXJURL] == [NSNull null])
    {
        self.url = @"";
    }
    else
    {
        self.url = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJURL]];
    }
    
}
@end
