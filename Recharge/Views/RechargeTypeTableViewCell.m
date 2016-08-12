//
//  RechargeTypeTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "RechargeTypeTableViewCell.h"

@interface RechargeTypeTableViewCell()
{
    UIImageView *iconView;
    UILabel *titleLbl;
    UILabel *infoLnl;
    UIImageView *selectView;
}
@end

@implementation RechargeTypeTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        iconView = [[UIImageView alloc]init];
        iconView.backgroundColor = [UIColor redColor];
        [self addSubview:iconView];
        
        titleLbl = [[UILabel alloc]init];
        titleLbl.text = @"支付宝支付";
        titleLbl.font = [UIFont boldSystemFontOfSize:14];
        titleLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLbl];
        
        infoLnl= [[UILabel alloc]init];
        infoLnl.text = @"推荐有支付宝账号的用户使用";
        infoLnl.textColor = [UIColor getColor:@"707070"];
        infoLnl.font = [UIFont systemFontOfSize:13];
        infoLnl.backgroundColor = [UIColor clearColor];
        [self addSubview:infoLnl];
        
        selectView = [[UIImageView alloc]init];
        selectView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:selectView];
        
        
        iconView.sd_layout
        .leftSpaceToView(self,10)
        .widthIs(40)
        .topSpaceToView(self,5)
        .bottomSpaceToView(self,5);
        
        titleLbl.sd_layout
        .leftSpaceToView(iconView,10)
        .rightSpaceToView(self,10)
        .topSpaceToView(self,5)
        .bottomSpaceToView(self,25);
        
        infoLnl.sd_layout
        .leftSpaceToView(iconView,5)
        .rightSpaceToView(self,10)
        .topSpaceToView(titleLbl,5)
        .bottomSpaceToView(self,0);
        
        selectView.sd_layout
        .rightSpaceToView(self,10)
        .centerYEqualToView(self)
        .widthIs(25)
        .heightIs(25);
        
    }
    return self;
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
