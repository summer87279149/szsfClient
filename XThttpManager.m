//
//  XThttpManager.m
//  foot
//
//  Created by Admin on 16/9/28.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "XThttpManager.h"
#import "XTRequestManager.h"
@implementation XThttpManager
+(instancetype)shareManager
{
    static XThttpManager *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XThttpManager alloc]init];
        manager.imageArr =[[NSMutableArray alloc]initWithCapacity:0];
    });
    return manager;
}

#pragma mark - 请求数据(上传经纬度)
-(void)uploadLatAndLonComplete:(void(^)(NSMutableArray *array))handel{
    WS(weakSelf)
    NSNumber *pageNum = [NSNumber numberWithInteger:1];
    NSDictionary *prama = @{@"page":pageNum};
    [XTRequestManager GET:kShop parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        NSLog(@"商城返回数据%@",responseObject);
        for (NSDictionary *dicc in responseObject[@"prodbanner"]) {
            [weakSelf.imageArr addObject:dicc[@"banner"]];
        }
        if (weakSelf.imageArr.count>3) {
            NSInteger count = weakSelf.imageArr.count;
            NSRange range = NSMakeRange(3, count-3);
            [weakSelf.imageArr removeObjectsInRange:range];
        }
//        NSLog(@"传餐之前数组是:%@",weakSelf.imageArr);
        handel(weakSelf.imageArr);
    } failure:^(NSError *error) {
        
        
    }];
}



@end
