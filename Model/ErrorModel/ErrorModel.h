//
//  ErrorModel.h
//  DazhongStoryBoard
//
//  Created by wangjun on 13-11-6.
//  Copyright (c) 2013年 yangzho.epro.com. All rights reserved.
//

#import "BasicModel.h"

@interface ErrorModel : BasicModel
{
    NSString *m_errorCode;          // 错误码
    NSString *m_errorMessage;       // 错误信息
}

@property (nonatomic, retain) NSString *m_errorCode;          // 错误码
@property (nonatomic, retain) NSString *m_errorMessage;       // 错误信息

@end
