//
//  TableViewCell.m
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        //项目名称
        _name = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self addSubview:_name];
        _name.text = @"清水足浴";
        _name.sd_layout.topEqualToView(self).bottomEqualToView(self).xIs(3).widthIs(self.frame.size.width/1.5);
        
        //距离
        _distance = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:right andBackgroundColor:nil];
        [self addSubview:_distance];
        _distance.text = @"附近36人可约";
        _distance.sd_layout.topEqualToView(self).bottomEqualToView(self).rightSpaceToView(self,3);
    }
    return self;
}
-(void)setTabelCellModel:(TabelCellModel *)tabelCellModel{
    _tabelCellModel = tabelCellModel;
    _name.text = tabelCellModel.name;
    _distance.text = tabelCellModel.distance;
}
@end
