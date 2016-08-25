//
//  MyCustomCell.m
//  ShoppingList_Demo
//
//  Created by 李金华 on 15/4/20.
//  Copyright (c) 2015年 LJH. All rights reserved.
//

#import "MyCustomCell.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)

@implementation MyCustomCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView *imageView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height130"]];
        imageView.frame = CGRectMake(0, 0, kScreenWidth,120);
        [self addSubview:imageView];
        
        
        //布局界面
        UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, WIDTH-10, 95)];
        bgView.backgroundColor = [UIColor clearColor];
    
        //添加商品图片
        _goodsImgV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 80, 80)];
        _goodsImgV.backgroundColor = [UIColor greenColor];
        [bgView addSubview:_goodsImgV];
        
        //添加商品标题
        _goodsTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 5, 200, 30)];
        _goodsTitleLab.text = @"afadsfa fa";
        _goodsTitleLab.font = [UIFont systemFontOfSize:15];
        _goodsTitleLab.textColor = COLOR;
        _goodsTitleLab.backgroundColor = [UIColor clearColor];
        [bgView addSubview:_goodsTitleLab];
        
        //促销价
        _priceTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 35, 70, 30)];
        _priceTitleLab.text = @"会员价:";
        _priceTitleLab.font = [UIFont systemFontOfSize:13];
        _priceTitleLab.textColor = COLOR;
        _priceTitleLab.backgroundColor = [UIColor clearColor];
        [bgView addSubview:_priceTitleLab];
        
        //商品价格
        _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(160, 35, 100, 30)];
        _priceLab.text = @"1990";
        _priceLab.font = [UIFont systemFontOfSize:13];
        _priceLab.textColor = [UIColor redColor];
        [bgView addSubview:_priceLab];
        
        //购买数量
        _goodsNumLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 65, 90, 30)];
        _goodsNumLab.text = @"购买数量：";
        _goodsNumLab.font = [UIFont systemFontOfSize:13];
        [bgView addSubview:_goodsNumLab];
        
        //减按钮
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(180, 65, 30, 30);
        _deleteBtn.layer.cornerRadius = 5;
        [_deleteBtn setImage:[UIImage imageNamed:@"按钮-.png"] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(deleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.tag = 11;
        [bgView addSubview:_deleteBtn];
        
        //购买商品的数量
        _numCountLab = [[UILabel alloc]initWithFrame:CGRectMake(210, 65, 50, 30)];
        _numCountLab.textAlignment = NSTextAlignmentCenter;
        _numCountLab.textColor = COLOR;
        _numCountLab.font = [UIFont systemFontOfSize:13];
        [bgView addSubview:_numCountLab];
        
        //加按钮
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake(260, 65, 30, 30);
        _addBtn.layer.cornerRadius = 5;
        [_addBtn setImage:[UIImage imageNamed:@"按钮+.png"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _addBtn.tag = 12;
        [bgView addSubview:_addBtn];
        
        //是否选中图片
        _isSelectImg = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH - 50, 10, 30, 30)];
        [bgView addSubview:_isSelectImg];
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:bgView];
    }
    return self;
}

/**
 *  给单元格赋值
 *
 *  @param goodsModel 里面存放各个控件需要的数值
 */
-(void)addTheValue:(GoodsInfoModel *)goodsModel
{
    _goodsImgV.image = [UIImage imageNamed:goodsModel.imageName];
    _goodsTitleLab.text = goodsModel.goodsTitle;
    _priceLab.text = goodsModel.goodsPrice;
    _numCountLab.text = [NSString stringWithFormat:@"%d",goodsModel.goodsNum];
    
    if (goodsModel.selectState)
    {
        _selectState = YES;
        _isSelectImg.image = [UIImage imageNamed:@"复选框-选中"];
    }else{
        _selectState = NO;
        _isSelectImg.image = [UIImage imageNamed:@"复选框-未选中"];
    }
    
}

/**
 *  点击减按钮实现数量的减少
 *
 *  @param sender 减按钮
 */
-(void)deleteBtnAction:(UIButton *)sender
{
    //判断是否选中，选中才能点击
    if (_selectState == YES)
    {
        //调用代理
        [self.delegate btnClick:self andFlag:(int)sender.tag];
    }

}
/**
 *  点击加按钮实现数量的增加
 *
 *  @param sender 加按钮
 */
-(void)addBtnAction:(UIButton *)sender
{
    //判断是否选中，选中才能点击
    if (_selectState == YES)
    {
        //调用代理
        [self.delegate btnClick:self andFlag:(int)sender.tag];
    }

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
