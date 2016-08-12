//
//  ThreeTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/8/8.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ThreeTableViewCell.h"
#import "UILabel+XTinit.h"
@implementation ThreeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //姓名
        self.name = [UILabel sharedWithFont:14.0 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        self.name.text = @"181****8289";
        [self addSubview:self.name];
        self.name.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,5*k_scaleHeight).heightIs(15*k_scaleHeight).widthIs(200);
        //评论
        self.comments = [UILabel sharedWithFont:11 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        self.comments.text = @"做的不错，下次还来找你";
        self.comments.lineBreakMode = NSLineBreakByCharWrapping;
        self.comments.numberOfLines = 0;
        [self addSubview:self.comments];
        self.comments.sd_layout.leftSpaceToView(self,10).topSpaceToView(self.name,5*k_scaleHeight).heightIs(11*k_scaleHeight).widthIs(kScreenWidth*2/3);
    //项目
        self.project = [UILabel sharedWithFont:12 andColor:[UIColor darkGrayColor] andAnligment:right andBackgroundColor:nil];
        [self addSubview:self.project];
        self.project.sd_layout.rightSpaceToView(self,10).centerYEqualToView(self.name).heightIs(15*k_scaleHeight).widthIs(kScreenWidth-200);
        self.project.text = @"项目：肩颈腰调理";
        
        //时间
        self.time = [UILabel sharedWithFont:11 andColor:[UIColor darkGrayColor] andAnligment:right andBackgroundColor:nil];
        self.time.text = @"2016年8月1日";
        [self addSubview:self.time];
        self.time.sd_layout.rightSpaceToView(self,10).topEqualToView(self.comments).heightIs(11*k_scaleHeight).widthIs(kScreenWidth/3);
    
    }
    return self;
}
@end
