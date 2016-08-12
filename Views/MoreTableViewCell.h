//
//  MoreTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/4/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopMode.h"

@protocol MoreTableViewCellDelegate <NSObject>

- (void)sendBtnTag:(NSInteger)btnTag;

@end

@interface MoreTableViewCell : UITableViewCell
{
    __weak id<MoreTableViewCellDelegate>moreCell_deleagte;
}
@property(nonatomic,weak)id<MoreTableViewCellDelegate>moreCell_deleagte;
- (void)getDataArr:(NSMutableArray *)imgArr;
@end
