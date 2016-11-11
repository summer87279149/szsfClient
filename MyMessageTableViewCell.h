//
//  MyMessageTableViewCell.h
//  foot
//
//  Created by Admin on 16/10/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyMessageModel;
@interface MyMessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic,strong)MyMessageModel *myMessageModel;
@end
