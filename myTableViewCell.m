//
//  myTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/8/6.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellBG"]];
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        //添加左边的图片
        self.imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"exe1"]];
        [self addSubview:self.imageview];
        self.imageview.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,10).bottomSpaceToView(self,10).widthIs(140*k_scale);
        //项目名字
        self.name = [[UILabel alloc]init];
        self.name.text = @"小儿三伏推";
        self.name.font = [UIFont systemFontOfSize:17];
        self.name.textColor = [UIColor getColor:@"3B2935"];
        [self addSubview:self.name];
        self.name.sd_layout.leftSpaceToView(self.imageview,10).topSpaceToView(self,10);
        //"宜"图标
        UIImageView *iView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"宜"]];
        [self addSubview:iView];
        iView.sd_layout.leftSpaceToView(self.imageview,10).topSpaceToView(self.name,10).widthIs(20).heightIs(20);
        //作用 、功能
        self.shiyi = [[UILabel alloc]init];
        self.shiyi.textColor = [UIColor darkGrayColor];
        self.shiyi.numberOfLines = 0;
        self.shiyi.lineBreakMode = NSLineBreakByCharWrapping;
        self.shiyi.font = [UIFont systemFontOfSize:12];
        self.shiyi.text = @"跌打损伤";
        [self addSubview:self.shiyi];
        self.shiyi.sd_layout.leftSpaceToView(iView,10).topSpaceToView(self.name,5).rightSpaceToView(self,10).heightIs(30);
        //时钟
        UIImageView *iView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"时钟"]];
        [self addSubview:iView2];
        iView2.sd_layout.leftSpaceToView(self.imageview,10).topSpaceToView(iView,10).heightIs(20).widthIs(20);
        //时长
        self.time = [[UILabel alloc]init];
        [self addSubview:self.time];
        self.time.textColor = [UIColor darkGrayColor];
        self.time.text = @"60分钟  193人选择";
        self.time.font = [UIFont systemFontOfSize:13];
        self.time.sd_layout.leftSpaceToView(iView2,10).topSpaceToView(self.shiyi,8).heightIs(15);
        
       
        //价格
        self.price = [[UILabel alloc]init];
        [self addSubview:self.price];
        self.price.text = @"988.00元";
        self.price.font = [UIFont systemFontOfSize:15];
        self.price.textColor = [UIColor getColor:@"A0974D"];
        self.price.sd_layout.topSpaceToView(self.shiyi,15).leftSpaceToView(self.imageview,10);
        //预约按钮
        self.button = [[UIButton alloc]init];
        [self addSubview:self.button];
        [self.button setTitle:@"预约" forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor getColor:@"3B2935"] forState:UIControlStateNormal];
        [self.button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        self.button.tintColor = [UIColor getColor:@"3B2935"];
        self.button.layer.borderWidth = 1;
        self.button.layer.borderColor = [[UIColor getColor:@"3B2935"] CGColor];
        self.button.sd_layout.widthIs(40*k_scale).heightIs(20*k_scale).rightSpaceToView(self,10).topSpaceToView(self.time,15);
        
    }
    return self;
}


@end
