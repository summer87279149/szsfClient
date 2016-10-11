//
//  CollectionViewCellModel.h
//  foot
//
//  Created by Admin on 16/8/18.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BasicModel.h"

@interface CollectionViewCellModel : BasicModel

@property(nonatomic,copy) NSString *imageUrl;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *contentSize;

@property(nonatomic,copy) NSString *price;

@property(nonatomic,copy) NSString *cellID;

@end
