//
//  ProjectModel.h
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
//服务模型
@interface ProjectModel : BasicModel
{
    NSString *projectID;
    NSString *imageURL;
    NSString *projectName;
    NSString *services;
    NSString *price;
}
//
@property(nonnull,strong)NSString *projectID;
//
@property(nonnull,strong)NSString *imageURL;
//
@property(nonnull,strong)NSString *projectName;
//
@property(nonnull,strong)NSString *services;
//
@property(nonnull,strong)NSString *price;
@end
