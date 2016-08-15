//
//  ShopTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/4/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopMode.h"

@protocol ShopTableViewCellDelegate <NSObject>

- (void)sendIndexPath:(NSIndexPath *)pathIndex;

@end

@interface ShopTableViewCell : UITableViewCell


@property(nonatomic,weak)id<ShopTableViewCellDelegate>shopCel_delegate;

- (void)getData:(NSIndexPath *)path;
- (void)getDataModel:(ShopMode *)mode;
@end
