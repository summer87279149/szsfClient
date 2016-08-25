//
//  ToMyHomeTableViewCell.h
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ToMyHomeCellModel.h"
@protocol ToMyHomeTableViewCellDelegate <NSObject>
@required
-(void)cellOrderBtnClicked;
-(void)focusBtnClick:(UITableViewCell *)cell ;//andTitle:(NSString *)title;
-(void)cancelFocusBtnClick:(UITableViewCell *)cell ;
@end
@interface ToMyHomeTableViewCell : UITableViewCell
//头像
@property(nonatomic,strong) UIImageView* imageview;
//今日可约
@property(nonatomic,strong) UIButton *jinRiKeYue;
//名字
@property(nonatomic,strong) UILabel *name;
//评分：
@property(nonatomic,strong) UILabel *grade;
//单数
@property(nonatomic,strong) UILabel *orderNumber;
//距离：
@property(nonatomic,strong) UILabel *distance;
//关注按钮
@property(nonatomic,strong) UIButton *focusButton;
//文字
@property(nonatomic,strong) UILabel *text;
//项目
@property(nonatomic,strong) UILabel *project;
//技师所属
@property(nonatomic,strong) UILabel *belongTo;

//预约按钮
@property(nonatomic,strong) UIButton *button;
//cell 高度
@property (nonatomic,assign) CGFloat HEIGHT;

//model
@property (nonatomic,strong)ToMyHomeCellModel *toMyHomeCellModel;
@property(nonatomic,weak) id <ToMyHomeTableViewCellDelegate> delegate;
@end
