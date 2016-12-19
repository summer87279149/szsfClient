//
//  PayServiceViewController.h
//  foot
//
//  Created by Admin on 16/12/13.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayServiceViewController : UIViewController
//订单号
@property(nonatomic,copy)NSString *orderNumber;

//总价格
@property(nonatomic,copy)NSString *totalPrice;
@end
