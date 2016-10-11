//
//  GoodSViewController.h
//  foot
//
//  Created by Admin on 16/8/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodSViewController : UIViewController
//商品ID
@property(nonatomic,strong) NSString *productID;

//项目介绍view
@property(nonatomic,strong) UIView *projectView;
//名字
@property (nonatomic,strong) UILabel *name;
//作用、适宜：
@property (nonatomic,strong) UILabel *shiyi;
//时长 选择人数
@property(nonatomic,strong) UILabel *time;
// 价格
@property(nonatomic,strong) UILabel *price;
//评论、好评
@property(nonatomic,strong) UILabel *comments;
//显示评论的View
@property(nonatomic,strong) UIView *commentView;
//商品规格
@property(nonatomic,strong) UILabel *goodsSize;
@end
