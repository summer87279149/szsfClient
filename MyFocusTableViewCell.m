//
//  MyFocusTableViewCell.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MyFocusTableViewCell.h"

@implementation MyFocusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.techView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        [self addSubview:self.techView];
        
        self.portrait = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.portrait.layer.cornerRadius = 40;
        self.portrait.layer.masksToBounds = YES;
        self.portrait.backgroundColor = COLOR;
        [self.techView addSubview:self.portrait];
        //姓名
        self.techName = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 200, 15)];
        self.techName.textColor = COLOR;
        [self.techView addSubview:self.techName];
        //章 图标
        self.AuthenticationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"名师"]];
        self.AuthenticationImage.frame = CGRectMake(100, 45, 40, 40);
        [self.techView addSubview:self.AuthenticationImage];
        //技能、工作年限
        self.skill = [[UILabel alloc]init];
        self.skill.textColor =COLOR;
        self.skill.font = [UIFont systemFontOfSize:11];
        [self.techView addSubview:self.skill];
        self.skill.sd_layout.leftSpaceToView(self.AuthenticationImage,10).rightSpaceToView(self.techView,10).topEqualToView(self.AuthenticationImage).heightIs(15);
        //小人图标
        UIImageView *smallPersonIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"小人"]];
        [self.techView addSubview:smallPersonIcon];
        smallPersonIcon.sd_layout.topSpaceToView(self.skill,10).leftSpaceToView(self.AuthenticationImage,10).heightIs(15).widthIs(15);
        //服务次数
        self.serviceTimes = [[UILabel alloc]init];
        [self.techView addSubview:self.serviceTimes];
        self.serviceTimes.sd_layout.leftSpaceToView(smallPersonIcon,3).topEqualToView(smallPersonIcon).heightIs(15).rightSpaceToView(self.techView,10);
        self.serviceTimes.textColor = [UIColor darkGrayColor];
        self.serviceTimes.font = [UIFont systemFontOfSize:11];
        
        UIButton *button = [[UIButton alloc]init];
        [self.techView addSubview:button];
        [button setTitle:@"  >  " forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button setTitleColor:COLOR forState:UIControlStateNormal];
        button.sd_layout.rightSpaceToView(self.techView,0).centerYEqualToView(self.techView).heightIs(20).widthIs(30);

        
        
    }
    return self;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end