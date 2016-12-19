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
    
    self.gotoCompleteButton.layer.cornerRadius=1;
    self.gotoCompleteButton.layer.borderColor =[COLOR CGColor];
    self.gotoCompleteButton.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnClick:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"评价"]){
      [self.delegate MyOrderCellBtnClickedComment:self];
    }
    
}

- (IBAction)gotoCompleteBtnClicked:(UIButton *)sender {
    [self.delegate MyOrderCellBtnClicked:self];

}





-(void)setMyOrderCellModel:(MyOrderCellModel *)myOrderCellModel{
    _myOrderCellModel = myOrderCellModel;
                
    self.name.text = myOrderCellModel.name;
    //如果要该回头的话，把下面的3行删掉，再把 ／＊ ＊／里面的打开
    self.button.hidden = NO;
//    self.status.text = @"等待服务";
    self.gotoCompleteButton.hidden = YES;

    /*
    if ([myOrderCellModel.status integerValue]==1) {
        self.button.hidden = NO;
        self.status.text = @"已完成";
        self.gotoCompleteButton.hidden = YES;
    }else{
        self.status.text = @"未完成";
        self.button.hidden = YES;
        self.gotoCompleteButton.hidden = NO;
    }*/
    
    self.counts.text = [NSString stringWithFormat:@"数量:%@",myOrderCellModel.counts];

    self.price.text = [NSString stringWithFormat:@"总价:¥%@",myOrderCellModel.price];
    [self.image sd_setImageWithURL:URLWITHSTRING(myOrderCellModel.imageUrl)];
    self.orderNnumber.text = [NSString stringWithFormat:@"订单号:%@",myOrderCellModel.orderNnumber];
    if([myOrderCellModel.isRemarked isEqualToString:@"1"]) {
        self.status.text = @"等待服务";
        self.gotoCompleteButton.hidden = NO;
        self.button.hidden = YES;
    }
    if ([myOrderCellModel.isRemarked isEqualToString:@"3"]) {
        self.status.text = @"已完成";
        [self.button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.button setTitle:@"已评价" forState:UIControlStateNormal];
        self.button.enabled = NO;
    }
    if ([myOrderCellModel.isRemarked isEqualToString:@"2"]) {
        self.status.text = @"待评价";
        [self.button setTitleColor:COLOR forState:UIControlStateNormal];
        [self.button setTitle:@"评价" forState:UIControlStateNormal];
        self.button.enabled = YES;
    }
    NSLog(@"是否评价:%@",myOrderCellModel.isRemarked);
}
@end
