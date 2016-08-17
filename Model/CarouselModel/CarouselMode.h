//
//  CarouselMode.h
//  FootMassage
//
//  Created by Admin on 16/4/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
//轮播模型
@interface CarouselMode : BasicModel

@property(nonatomic,strong)NSString *imageUrl;
@property(nonatomic,strong)NSString *imageName;
@property(nonatomic,strong)NSString *imageID;
@property(nonatomic,strong)NSString *url;
//商家id
@property(nonatomic,strong)NSString *shopID;
@end
