//
//  AddSecondViewController.h
//  数据库
//
//  Created by Admin on 16/10/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityModel.h"
@interface AddSecondViewController : UIViewController

@property(nonatomic,strong)CityModel *Privincemodel;
@property (nonatomic,retain) NSMutableArray *citysArr;
@end
