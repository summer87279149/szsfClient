//
//  ErrorModel.m
//  DazhongStoryBoard
//
//  Created by wangjun on 13-11-6.
//  Copyright (c) 2013年 yangzho.epro.com. All rights reserved.
//

#import "ErrorModel.h"

#define kErrorCode              @"errorCode"
#define kErrorMessage           @"errorMessage"

@implementation ErrorModel


- (void)dealloc
{
    self.m_errorCode = nil;
    self.m_errorMessage = nil;
}

- (void)parseFromDictionary:(NSDictionary *)dic
{
    if ([dic objectForKey:kErrorCode] == nil ||
        [dic objectForKey:kErrorCode] == [NSNull null])
    {
        self.m_errorCode = @"";
    }
    else
    {
        self.m_errorCode = [NSString stringWithFormat:@"%@",[dic objectForKey:kErrorCode]];
    }
    
    if ([dic objectForKey:kErrorMessage] == nil ||
        [dic objectForKey:kErrorMessage] == [NSNull null])
    {
        self.m_errorMessage = @"";
    }
    else
    {
        self.m_errorMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:kErrorMessage]];
    }
}

@end
