//
//  MyOrderTableViewCell.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MallOrderTableViewCell.h"

@implementation MallOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.button.layer.cornerRadius=3;
    self.button.layer.borderColor =[COLOR CGColor];
    self.button.layer.borderWidth = 1;
    
    self.gotoCompleteButton.layer.cornerRadius=2;
    self.gotoCompleteButton.layer.borderColor =[COLOR CGColor];
    self.gotoCompleteButton.layer.borderWidth = 1;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(MallOrderCellBtnClickedComment:)]) {
        if ([sender.currentTitle isEqualToString:@"评价"]){
            [self.delegate MallOrderCellBtnClickedComment:self];
        }
    }
    
    
}

- (IBAction)gotoCompleteBtnClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(MallOrderCellBtnClicked:)]) {
        [self.delegate MallOrderCellBtnClicked:self];
    }
}


-(void)setMyOrderCellModel:(MallOrderCellModel *)myOrderCellModel{
    _myOrderCellModel = myOrderCellModel;
                
    self.name.text = myOrderCellModel.name;
    //如果要该回头的话，把下面的3行删掉，再把 ／＊ ＊／里面的打开
//    self.button.hidden = NO;
//    self.status.text = @"已预约过";
//    self.gotoCompleteButton.hidden = YES;

    NSLog(@"订单状态是:%@",myOrderCellModel.status);
    if ([myOrderCellModel.status integerValue]==1) {
        self.button.hidden = YES;
        self.status.text = @"已付款";
        self.gotoCompleteButton.hidden = YES;
    }else{
        self.status.text = @"未完成";
        self.button.hidden = YES;
        self.gotoCompleteButton.hidden = YES;
    }
    
    self.counts.text = [NSString stringWithFormat:@"数量:%@",myOrderCellModel.counts];

    self.price.text = [NSString stringWithFormat:@"总价:¥%@",myOrderCellModel.price];
    [self.image sd_setImageWithURL:URLWITHSTRING(myOrderCellModel.imageUrl)];
//    self.orderNnumber.text = [NSString stringWithFormat:@"订单号:%@",myOrderCellModel.orderNnumber];
}
@end
