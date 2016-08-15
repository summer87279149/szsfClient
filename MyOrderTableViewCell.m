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

@end
