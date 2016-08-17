//
//  ProjectTableViewCell.h
//  FootMassage
//
//  Created by Admin on 16/4/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModal.h"

@protocol ProjectTableViewCellDelegate <NSObject>

- (void)sendReserveTag:(NSIndexPath *)pathIndex;

@end

@interface ProjectTableViewCell : UITableViewCell
{
    __weak id<ProjectTableViewCellDelegate>proCel_delegate;
}

@property(nonatomic,weak)id<ProjectTableViewCellDelegate>proCel_delegate;

- (void)getData:(NSIndexPath *)path;
- (void)getDataModel:(ProjectModal *)mode;
@end
