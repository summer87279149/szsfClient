//
//  ShopDetailVC.h
//  FootMassage
//
//  Created by Admin on 16/8/5.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopDetailVC : UIViewController

//店名
@property (weak, nonatomic) IBOutlet UILabel *name;
//店铺地址
@property (weak, nonatomic) IBOutlet UILabel *address;
//店铺距离
@property (weak, nonatomic) IBOutlet UILabel *distance;
//已售数量
@property (weak, nonatomic) IBOutlet UILabel *saled;
//用户评价
@property (weak, nonatomic) IBOutlet UILabel *comment;
//好评数量
@property (weak, nonatomic) IBOutlet UILabel *goodCommentNumber;
//显示更多评论按钮
@property (weak, nonatomic) IBOutlet UIButton *moreCommentButton;

@end
