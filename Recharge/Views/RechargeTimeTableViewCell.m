//
//  RechargeTimeTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "RechargeTimeTableViewCell.h"

@interface RechargeTimeTableViewCell()
{
    UILabel *timeTitleLbl;
    UILabel *timeLbl;
}
@end

@implementation RechargeTimeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        timeTitleLbl = [[UILabel alloc]init];
        timeTitleLbl.text = @"充值时间";
        timeTitleLbl.textColor = [UIColor getColor:@"707070"];
        timeTitleLbl.font = [UIFont boldSystemFontOfSize:14];
        timeTitleLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:timeTitleLbl];
        
        timeLbl= [[UILabel alloc]init];
        timeLbl.text = @"2016.04.17  14:40:28";
        timeLbl.textColor = [UIColor getColor:@"4EB947"];
        timeLbl.font = [UIFont boldSystemFontOfSize:14];
        timeLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:timeLbl];

        
        UIImageView *lineView = [[UIImageView alloc]init];
        lineView.backgroundColor = [UIColor getColor:@"707070"];
        [self addSubview:lineView];

        timeTitleLbl.sd_layout
        .leftSpaceToView(self,10)
        .widthIs(100)
        .topSpaceToView(self,10)
        .bottomSpaceToView(self,10);
        
        lineView.sd_layout
        .leftSpaceToView(timeTitleLbl,0)
        .widthIs(1)
        .topSpaceToView(self,10)
        .bottomSpaceToView(self,10);
        
        timeLbl.sd_layout
        .leftSpaceToView(lineView,20)
        .rightSpaceToView(self,10)
        .topSpaceToView(self,10)
        .bottomSpaceToView(self,10);

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
