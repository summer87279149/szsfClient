//
//  ShopTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/4/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopMode.h"
#import "LHRatingView.h"
#import "ToShopCellModel.h"
@protocol ShopTableViewCellDelegate <NSObject>

- (void)sendIndexPath:(NSIndexPath *)pathIndex;

@end

@interface ShopTableViewCell : UITableViewCell



@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLbl;
@property(nonatomic,strong)UILabel *descriptionLbl;
@property(nonatomic,strong)UILabel *priceLbl;
@property(nonatomic,strong)UIButton *arrowBtn;
@property(nonatomic,strong)LHRatingView *rView;
@property(nonatomic,strong)UILabel *starLbl;
@property(nonatomic,strong)UILabel *nearLbl;

@property(nonatomic,weak)id<ShopTableViewCellDelegate>shopCel_delegate;
@property(nonatomic,strong)ToShopCellModel *toShopCellModel;
//- (void)getData:(NSIndexPath *)path;
//- (void)getDataModel:(ShopMode *)mode;
@end
