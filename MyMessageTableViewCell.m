//
//  MyMessageTableViewCell.m
//  foot
//
//  Created by Admin on 16/10/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MyMessageTableViewCell.h"
#import "MyMessageModel.h"
@implementation MyMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setMyMessageModel:(MyMessageModel *)myMessageModel{
    
    _myMessageModel = myMessageModel;
    self.timeLabel.text = myMessageModel.time;
    self.contentLabel.text = myMessageModel.content;
}
@end
