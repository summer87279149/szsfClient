//
//  ToShopCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//
#define XXJimageUrl                             @""
#define XXJname                                 @""
#define XXdescrip                               @""
#define XXprice                                 @""
#define XXstar                                  @""
#define XXnear                                  @""


#import "ToShopCellModel.h"

@implementation ToShopCellModel
- (void)parseFromDictionary:(NSDictionary *)dic
{
    //tu pian
    if ([dic objectForKey:XXJimageUrl]==nil||[dic objectForKey:XXJimageUrl] == [NSNull null])
    {
        self.imageUrl = @"";
    }
    else
    {
        self.imageUrl = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJimageUrl]];
    }
    // ming cheng
    if ([dic objectForKey:XXJname]==nil||[dic objectForKey:XXJname] == [NSNull null])
    {
        self.name = @"";
    }
    else
    {
        self.name = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJname]];
    }
    //dianpu miaoshu
    
    if ([dic objectForKey:XXdescrip]==nil||[dic objectForKey:XXdescrip] == [NSNull null])
    {
        self.descrip = @"";
    }
    else
    {
        self.descrip = [NSString stringWithFormat:@"%@",[dic objectForKey:XXdescrip]];
    }
    
    
    //junjia
    if ([dic objectForKey:XXprice]==nil||[dic objectForKey:XXprice] == [NSNull null])
    {
        self.price = @"";
    }
    else
    {
        self.price = [NSString stringWithFormat:@"%@",[dic objectForKey:XXprice]];
    }
    //ping fen
    if ([dic objectForKey:XXstar]==nil||[dic objectForKey:XXstar] == [NSNull null])
    {
        self.star = 5.0;
    }
    else
    {
        self.star = [dic[XXstar] floatValue];;
    }
    
    //juli
    if ([dic objectForKey:XXnear]==nil||[dic objectForKey:XXnear] == [NSNull null])
    {
        self.near = @"";
    }
    else
    {
        self.near = [NSString stringWithFormat:@"%@",[dic objectForKey:XXnear]];
    }

}
@end
