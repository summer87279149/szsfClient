//
//  HomeTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/4/25.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"
@interface HomeTableViewCell : UITableViewCell
@property (strong,nonatomic)HomeCellModel *homeCellModel;
- (void)sendType:(NSString *)typeStr;
@end
