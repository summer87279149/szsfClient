//
//  TableViewCell.h
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabelCellModel.h"
@interface TableViewCell : UITableViewCell
//项目名字
@property(nonatomic,strong)UILabel *name;

//附近多少人可约
@property(nonatomic,strong)UILabel *distance;
//
@property(nonatomic,strong)TabelCellModel *tabelCellModel;
//
@end
