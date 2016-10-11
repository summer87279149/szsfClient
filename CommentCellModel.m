//
//  CommentCellModel.m
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CommentCellModel.h"
#define XXJname                 @"nickname"
#define XXJserviceName          @"projectname"
#define XXJtime                 @"date"
#define XXJcommentContent       @"content"
#define XXJgrade                @"stars"
@implementation CommentCellModel
-(void)parseFromDictionary:(NSDictionary *)dic{
    
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
    if ([dic objectForKey:XXJserviceName] == nil ||
        [dic objectForKey:XXJserviceName] == [NSNull null])
    {
        self.serviceName = @"";
    }
    else
    {
        self.serviceName = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJserviceName]];
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
    
    //
    if ([dic objectForKey:XXJcommentContent] == nil ||
        [dic objectForKey:XXJcommentContent] == [NSNull null])
    {
        self.commentContent = @"";
    }
    else
    {
        self.commentContent = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJcommentContent]];
    }
    
    //
    if ([dic objectForKey:XXJgrade] == nil ||
        [dic objectForKey:XXJgrade] == [NSNull null])
    {
        self.grade = 0;
    }
    else
    {
//        self.grade = [NSString stringWithFormat:@"%@",[dic objectForKey:XXJgrade]];
        self.grade = [dic[XXJgrade] floatValue]/5;
    }
    
}
@end
