//
//  MyCollectTableViewCell.h
//  foot
//
//  Created by Admin on 16/11/4.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectTableViewCell.h"
#import "MyCollectionModel.h"
#import "LHRatingView.h"
@interface MyCollectTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLbl;
@property(nonatomic,strong)UILabel *descriptionLbl;
@property(nonatomic,strong)UILabel *priceLbl;
@property(nonatomic,strong)UIButton *arrowBtn;
@property(nonatomic,strong)LHRatingView *rView;
@property(nonatomic,strong)UILabel *starLbl;
@property(nonatomic,strong)UILabel *nearLbl;


@property(nonatomic,strong)MyCollectionModel *myCollectionModel;
@end
