//
//  MyOrderTableViewCell.h
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyOrderCellModel.h"
@protocol MyOrderTableViewCellDelegate <NSObject>
@required
//已取消
-(void)MyOrderCellBtnClicked;
//评价
-(void)MyOrderCellBtnClickedComment;
@end

@interface MyOrderTableViewCell : UITableViewCell
//项目名字
@property (weak, nonatomic) IBOutlet UILabel *name;
//状态：待付款
@property (weak, nonatomic) IBOutlet UILabel *status;

//数量
@property (weak, nonatomic) IBOutlet UILabel *counts;

//总价
@property (weak, nonatomic) IBOutlet UILabel *price;

//图片
@property (weak, nonatomic) IBOutlet UIImageView *image;

//按钮
@property (weak, nonatomic) IBOutlet UIButton *button;
//订单号
@property (weak, nonatomic) IBOutlet UILabel *orderNnumber;


@property (nonatomic,strong)MyOrderCellModel *myOrderCellModel;
@property (nonatomic,weak)id <MyOrderTableViewCellDelegate> delegate;

@end
