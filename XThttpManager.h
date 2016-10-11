//
//  XThttpManager.h
//  foot
//
//  Created by Admin on 16/9/28.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XThttpManager : NSObject
{
    NSNumber *lat;
    NSNumber *lon;
    NSInteger page ;
    NSMutableArray *NetImageArray;
}

@property(nonatomic,strong)NSMutableArray *imageArr;

-(void)uploadLatAndLonComplete:(void(^)(NSMutableArray *array))handel;
+(instancetype)shareManager;
@end
