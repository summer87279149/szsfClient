//
//  MyCollectionViewCell.h
//  FootMassage
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopCellModel.h"
@interface MyCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView *image;

@property(nonatomic,strong) UILabel *name;

@property(nonatomic,strong) UILabel *price;

@property(nonatomic,strong) UILabel *chooseNumber;

@property(nonatomic,strong) UILabel *time;

@property(nonatomic,strong) ShopCellModel *shopCellModel;
@end
