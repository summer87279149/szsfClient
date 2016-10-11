//
//  GoodsNumber.h
//  foot
//
//  Created by Admin on 16/8/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GoodsNumberDelegate<NSObject>
@required
-(void)BtnClicked;
@end
@interface GoodsNumber : UIView
//商品增加数量按钮
@property(nonatomic,strong)UIButton *incresBtn;
//减少按钮
@property(nonatomic,strong)UIButton *decresBtn;
//计数label
@property(nonatomic,strong)UILabel *countsLab;
//
@property(nonatomic,assign) int counts;

//背景颜色
@property(nonatomic,strong)UIColor *backgroundcolor;

@property (nonatomic,weak) id<GoodsNumberDelegate>  delegate;
@end
