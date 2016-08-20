//
//  MyOrderTableViewCell.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MyOrderTableViewCell.h"

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.button.layer.cornerRadius=3;
    self.button.layer.borderColor =[COLOR CGColor];
    self.button.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnClick:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"已取消"]) {
        [self.delegate MyOrderCellBtnClicked];
    }else if ([sender.currentTitle isEqualToString:@"评价"]){
        [self.delegate MyOrderCellBtnClickedComment];
    }
    
}

-(void)setMyOrderCellModel:(MyOrderCellModel *)myOrderCellModel{
    _myOrderCellModel = myOrderCellModel;
                
    self.name.text = myOrderCellModel.name;
    self.status.text = myOrderCellModel.status;
    self.counts.text = [NSString stringWithFormat:@"数量:%@",myOrderCellModel.counts];

    self.price.text = [NSString stringWithFormat:@"总价:¥%@",myOrderCellModel.price];
    [self.image sd_setImageWithURL:URLWITHSTRING(myOrderCellModel.imageUrl)];
    self.orderNnumber.text = myOrderCellModel.orderNnumber;
}
@end
