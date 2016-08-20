//
//  ToMyHomeTableViewCell.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ToMyHomeTableViewCell.h"

@implementation ToMyHomeTableViewCell

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
        //创建背景图片
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellBG-1"]];
        image.layer.masksToBounds = YES;
        [self addSubview:image];
        image.sd_layout.topSpaceToView(self,10+30*k_scale).leftSpaceToView(self,11).rightSpaceToView(self,11).bottomSpaceToView(self,10);
        
        //头像
        _imageview = [[UIImageView alloc]init];
        _imageview.layer.cornerRadius = 30*k_scale;
        _imageview.layer.masksToBounds = YES;
        _imageview.backgroundColor = COLOR;
        [self addSubview:_imageview];
        _imageview.sd_layout.centerXEqualToView(self).topSpaceToView(self,10).widthIs(60*k_scale).heightIs(60*k_scale);
       
        
        //关注按钮
        self.focusButton = [[UIButton alloc]init];
        [self addSubview:self.focusButton];
        [self.focusButton setTitle:@"+关注" forState:UIControlStateNormal];
        self.focusButton.alpha = 0.8;
        [self.focusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.focusButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.focusButton setBackgroundColor:COLOR];
        self.focusButton.layer.cornerRadius = 7*k_scale;
        self.focusButton.layer.masksToBounds = YES;
        [self.focusButton addTarget:self action:@selector(focusBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        self.focusButton.sd_layout.rightSpaceToView(self,14*k_scale).topSpaceToView(self,35*k_scaleHeight).heightIs(22).widthIs(67*k_scale);
        //今日可约
        _jinRiKeYue = [[UIButton alloc]init];
        _jinRiKeYue.layer.cornerRadius = 11;
        _jinRiKeYue.layer.masksToBounds = YES;
        _jinRiKeYue.titleLabel.textColor = COLOR;
        _jinRiKeYue.titleLabel.font = [UIFont systemFontOfSize:12];
        _jinRiKeYue.enabled = NO;
        [_jinRiKeYue setBackgroundImage:[UIImage imageNamed:@"今日可约"] forState:UIControlStateNormal];
        [_jinRiKeYue setTitle:@"  今日可约" forState:UIControlStateNormal];
        [image addSubview:_jinRiKeYue];
        _jinRiKeYue.sd_layout.leftSpaceToView(image,-11).topSpaceToView(image,5*k_scaleHeight).heightIs(22).widthIs(67*k_scaleHeight);
        //技师名字
        self.name = [UILabel sharedWithFont:15 andColor:[UIColor redColor] andAnligment:center andBackgroundColor:nil];
        [self addSubview:self.name];
//        self.name.sd_layout.topSpaceToView(_imageview,14*k_scaleHeight).leftSpaceToView(_imageview,0).rightSpaceToView(_imageview,0).heightIs(15);
        self.name.sd_layout.topSpaceToView(_imageview,14*k_scaleHeight).centerXEqualToView(_imageview).widthIs(100).heightIs(20);
        
        UILabel *pingfen =[UILabel sharedWithFont:13 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        pingfen.text = @"评分";
        [self addSubview:pingfen];
        UILabel *danshu = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        danshu.text = @"单数";
        [self addSubview:danshu];
        UILabel *juli = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        juli.text = @"距离";
        [self addSubview:juli];
        
        danshu.sd_layout.centerXEqualToView(self).topSpaceToView(self.name,10*k_scaleHeight).widthIs(80*k_scale).heightIs(15);
        
        pingfen.sd_layout.rightSpaceToView(danshu,10*k_scale).topEqualToView(danshu).widthIs(80*k_scale).heightIs(15);
        juli.sd_layout.leftSpaceToView(danshu,10*k_scale).topEqualToView(danshu).widthIs(80*k_scale).heightIs(15);
        
        
        
        self.grade = [UILabel sharedWithFont:14 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        self.orderNumber = [UILabel sharedWithFont:14 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        self.distance = [UILabel sharedWithFont:14 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        [self addSubview:self.grade];
        [self addSubview:self.orderNumber];
        [self addSubview:self.distance];
        self.grade.sd_layout.centerXEqualToView(pingfen).topSpaceToView(pingfen,10*k_scaleHeight).widthIs(80*k_scale).heightIs(20);
        self.orderNumber.sd_layout.centerXEqualToView(danshu).topSpaceToView(pingfen,10*k_scaleHeight).widthIs(80*k_scale).heightIs(20);
        self.distance.sd_layout.centerXEqualToView(juli).topSpaceToView(pingfen,10*k_scaleHeight).widthIs(80*k_scale).heightIs(20);
        
        
        //分割线
        
        UIView *line1 = [UIView lineWithColor:COLOR];
        [self addSubview:line1];
        UIView *line2 = [UIView lineWithColor:COLOR];
        [self addSubview:line2];
        UIView *line3 = [UIView lineWithColor:COLOR];
        [self addSubview:line3];
        line1.sd_layout.widthIs(1).topEqualToView(pingfen).leftSpaceToView(danshu,1).bottomEqualToView(self.grade);
        line2.sd_layout.widthIs(1).topEqualToView(pingfen).rightSpaceToView(danshu,1).bottomEqualToView(self.grade);
        line3.sd_layout.heightIs(1).topSpaceToView(self.orderNumber,10*k_scaleHeight).leftSpaceToView(self,50*k_scale).rightSpaceToView(self,50*k_scale);
        
        //文本
        self.text = [UILabel sharedWithFont:12 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self addSubview:self.text];
        
        self.text = [[UILabel alloc]initWithFrame:CGRectMake(10, 470, kScreenWidth, 200)];
        [self addSubview:self.text];
        self.text.textColor =COLOR;
        self.text.font = [UIFont systemFontOfSize:12];
        self.text.numberOfLines = 0;
        self.text.lineBreakMode = NSLineBreakByCharWrapping;
        self.text.text = @"● 服务说明:本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你同创造！服务说明:本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你同创造！";
        CGSize size = [self.text sizeThatFits:CGSizeMake(self.text.frame.size.width, 2000)];
        self.text.sd_layout.leftEqualToView(line3).rightEqualToView(line3).topSpaceToView(line3,5).heightIs(size.height);
        //项目
        self.project = [UILabel sharedWithFont:12 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self addSubview:self.project];
        self.project.sd_layout.topSpaceToView(self.text,10).leftEqualToView(self.text).rightEqualToView(self.text).heightIs(15);
        //横线
        UIView *line4= [UIView lineWithColor:COLOR];
        [self addSubview:line4];
        line4.sd_layout.leftEqualToView(self.text).rightEqualToView(self.text).topSpaceToView(self.project,2).heightIs(1);
        //技师所属
        self.belongTo = [UILabel sharedWithFont:12 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        [self addSubview:self.belongTo];
        self.belongTo.sd_layout.centerXEqualToView(self).topSpaceToView(line4,5).heightIs(15).widthIs(kScreenWidth);
        
        //预约按钮
        self.button = [[UIButton alloc]init];
        [self addSubview:self.button];
        self.button.backgroundColor = [UIColor clearColor];
        [self.button setTitle:@"预约" forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor getColor:@"3B2935"] forState:UIControlStateNormal];
        [self.button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        self.button.tintColor = [UIColor getColor:@"3B2935"];
        self.button.layer.borderWidth = 1;
        self.button.layer.borderColor = [[UIColor getColor:@"3B2935"] CGColor];
        self.button.sd_layout.widthIs(80*k_scale).heightIs(20*k_scaleHeight).centerXEqualToView(self).topSpaceToView(self.belongTo,15*k_scaleHeight);
        [self.button addTarget:self action:@selector(cellBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        //cell的高度
        self.height = 120+144*k_scaleHeight+size.height;
        NSLog(@"height = %f",self.height);
        

        
        self.name.text = @"郭德纲";
        self.grade.text = @"5.0分";
        self.orderNumber.text = @"1024单";
        self.distance.text = @"1.2km";
        self.project.text = @"项目：足疗、推拿、spa";
        self.belongTo.text = @"技师所属:亮点网络足疗";
    
    }
    
    return self;
}

-(void)setToMyHomeCellModel:(ToMyHomeCellModel *)toMyHomeCellModel{
    _toMyHomeCellModel = toMyHomeCellModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",toMyHomeCellModel.imageviewUrl]]];
    self.name.text = toMyHomeCellModel.name;
    self.grade.text = toMyHomeCellModel.grade;
    self.orderNumber.text = toMyHomeCellModel.orderNumber;
    self.distance.text = toMyHomeCellModel.distance;
    self.text.text = toMyHomeCellModel.text;
    self.project.text = toMyHomeCellModel.project;
    self.belongTo.text = toMyHomeCellModel.belongTo;
}








#pragma mark ========delegate=====
-(void)cellBtnClicked{
    
    [self.delegate cellOrderBtnClicked];
    
}
-(void)focusBtnClicked{
    if ([self.focusButton.titleLabel.text isEqualToString:@"+关注"]) {
        /**
         *  delegate关注
         */
        [self.focusButton setTitle:@"已关注" forState:UIControlStateNormal];
        
    }else{
        /**
         *  delegate取消关注
         */
        [self.focusButton setTitle:@"+关注" forState:UIControlStateNormal];
    }
}
@end
