//
//  CollectionViewCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJimageUrl         @"images"
#define XXJname             @"prodname"
#define XXJcontentSize      @"prodsize"
#define XXJprice            @"price"
#define XXJCellID           @"id"

#import "CollectionViewCellModel.h"

@implementation CollectionViewCellModel
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
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    
    //
    
    if ([dic objectForKey:XXJcontentSize]==nil||[dic objectForKey:XXJcontentSize] == [NSNull null])
    {
        self.contentSize = @"";
    }
    else
    {
        self.contentSize = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJcontentSize]];
    }
    //
    if ([dic objectForKey:XXJprice]==nil||[dic objectForKey:XXJprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJprice]];
    }
    
    if ([dic objectForKey:XXJCellID]==nil||[dic objectForKey:XXJCellID] == [NSNull null])
    {
        self.cellID = @"";
    }
    else
    {
        self.cellID = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJCellID]];
    }
}
@end
