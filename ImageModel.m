//
//  ImageModel.m
//  foot
//
//  Created by Admin on 16/9/28.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJimageUrl         @"images"
#define XXJimageID            @"id"


#import "ImageModel.h"

@implementation ImageModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    // tu pian
    if ([dic objectForKey:XXJimageUrl]==nil||[dic objectForKey:XXJimageUrl] == [NSNull null])
    {
        self.imageUrl = @"";
    }
    else
    {
        self.imageUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageUrl]];
    }
    // ming zi
    if ([dic objectForKey:XXJimageID]==nil||[dic objectForKey:XXJimageID] == [NSNull null])
    {
        self.imageID = @"";
    }
    else
    {
        self.imageID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageID]];
    }
   
}

@end
