//
//  BuyVCCell.m
//  foot
//
//  Created by Admin on 16/10/8.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "BuyVCCell.h"
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
@implementation BuyVCCell
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
        [self addSubview:bgView];
        
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
        _priceTitleLab.text = @"单价:";
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
        
        //购买商品的数量
        _numCountLab = [[UILabel alloc]initWithFrame:CGRectMake(210, 65, 50, 30)];
        _numCountLab.textAlignment = NSTextAlignmentLeft;
        _numCountLab.textColor = COLOR;
        _numCountLab.font = [UIFont systemFontOfSize:13];
        [bgView addSubview:_numCountLab];
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
    [_goodsImgV sd_setImageWithURL:URLWITHSTRING(goodsModel.imageName)];
    _goodsTitleLab.text = goodsModel.goodsTitle;
    _priceLab.text = goodsModel.goodsPrice;
    _numCountLab.text = [NSString stringWithFormat:@"%d",goodsModel.goodsNum];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
