//
//  MapMode.h
//  HJWJJ
//
//  Created by mingchen macos on 15/5/25.
//  Copyright (c) 2015年 mingchen macos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"

@interface MapMode : BasicModel
{
    
    NSString *projectId;
    NSString *projectName;
    NSString *pointX;
    NSString *pointY;
    NSString *address;
    NSString *distance;
    NSString *recordId;
    NSString *recordDate;
    NSString *title;
    NSString *htmlStr;
    NSString *recordPersonName;
    NSString *area;
    NSString *startTime;
    NSString *imageUrl;
    
}
@property(nonatomic,strong)NSString *pointX;
@property(nonatomic,strong)NSString *pointY;
@property(nonatomic,strong)NSString *projectId;
@property(nonatomic,strong)NSString *projectName;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *distance;
@property(nonatomic,strong)NSString *recordId;
@property(nonatomic,strong)NSString *recordDate;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *htmlStr;
@property(nonatomic,strong)NSString *recordPersonName;
@property(nonatomic,strong)NSString *area;
@property(nonatomic,strong)NSString *startTime;
@property(nonatomic,strong)NSString *imageUrl;
@end
