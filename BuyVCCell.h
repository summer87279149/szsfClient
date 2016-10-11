//
//  BuyVCCell.h
//  foot
//
//  Created by Admin on 16/10/8.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsInfoModel.h"
@interface BuyVCCell : UITableViewCell

@property(strong,nonatomic)UIImageView *goodsImgV;//商品图片
@property(strong,nonatomic)UILabel *goodsTitleLab;//商品标题
@property(strong,nonatomic)UILabel *priceTitleLab;//价格标签
@property(strong,nonatomic)UILabel *priceLab;//具体价格
@property(strong,nonatomic)UILabel *goodsNumLab;//购买数量标签
@property(strong,nonatomic)UILabel *numCountLab;//购买商品的数量
@property(strong,nonatomic)UIButton *addBtn;//添加商品数量
@property(strong,nonatomic)UIButton *deleteBtn;//删除商品数量
@property(strong,nonatomic)UIButton *isSelectBtn;//是否选中按钮
@property(strong,nonatomic)UIImageView *isSelectImg;//是否选中图片

@property(assign,nonatomic)BOOL selectState;//选中状态


//赋值
-(void)addTheValue:(GoodsInfoModel *)goodsModel;


@end
