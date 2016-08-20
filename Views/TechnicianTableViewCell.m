//
//  TechnicianTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "TechnicianTableViewCell.h"
#import "LHRatingView.h"
#import "EGOImageView.h"

@interface TechnicianTableViewCell()
{
    EGOImageView *imageView;
    UILabel *nameLbl;
    UILabel *typeLbl;
    UILabel *ageLbl;
    UILabel *shopLbl;
    UILabel *ordersLbl;
    UILabel *nearLbl;
    LHRatingView *rView;
    UIImageView *sexImg;
}
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *nameLbl;
@property(nonatomic,strong)UILabel *typeLbl;
@property(nonatomic,strong)UILabel *ageLbl;
@property(nonatomic,strong)UILabel *shopLbl;
@property(nonatomic,strong)UILabel *ordersLbl;
@property(nonatomic,strong)UILabel *nearLbl;
@property(nonatomic,strong)LHRatingView *rView;
@end

@implementation TechnicianTableViewCell
@synthesize imageView,nameLbl,typeLbl,ageLbl,rView,shopLbl,ordersLbl,nearLbl;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //        //        self.iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //        //        iconImgView.backgroundColor = [UIColor lightGrayColor];
        //        //        [self addSubview:iconImgView];
        //
        //        self.backgroundColor = [UIColor lightGrayColor];
        
        self.imageView = [[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"smallDefualt.png"]];
        imageView.backgroundColor = [UIColor redColor];
        [self addSubview:imageView];
        
        self.nameLbl = [[UILabel alloc]init];
        nameLbl.text = @"张三";
        nameLbl.font = [UIFont boldSystemFontOfSize:15];
        nameLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:nameLbl];
        
        self.typeLbl =  [[UILabel alloc]init];
        typeLbl.text = @"足疗";
//        typeLbl.backgroundColor = [UIColor getColor:@"F9DC52"];
        typeLbl.textColor = [UIColor blackColor];
        typeLbl.layer.cornerRadius = 4;
        typeLbl.layer.borderWidth = 1;
        typeLbl.layer.borderColor = [UIColor colorWithRed:249/255.0 green:220/255.0 blue:82/255.0 alpha:1].CGColor;
//        typeLbl.layer.backgroundColor = [UIColor colorWithRed:249/255.0 green:220/255.0 blue:82/255.0 alpha:1].CGColor;
        typeLbl.textAlignment = 1;
        typeLbl.font = [UIFont boldSystemFontOfSize:13];
        [self addSubview:typeLbl];
        
        
        self.ageLbl = [[UILabel alloc]init];
        ageLbl.text = @"28";
//        ageLbl.backgroundColor = [UIColor getColor:@"01B7EE"];
        ageLbl.layer.cornerRadius = 4;
        ageLbl.layer.borderWidth = 1;
        ageLbl.layer.borderColor = [UIColor colorWithRed:1/255.0 green:183/255.0 blue:238/255.0 alpha:1].CGColor;
        
        ageLbl.textColor = COLOR;
        ageLbl.textAlignment = 2;
        ageLbl.font = [UIFont boldSystemFontOfSize:13];
        [self addSubview:ageLbl];
        
        sexImg = [[UIImageView alloc]init];
        sexImg.backgroundColor = [UIColor clearColor];
        [ageLbl addSubview:sexImg];
        
        shopLbl = [[UILabel alloc]init];
        shopLbl.text = @"虹桥养生会所";
        //        ageLbl.backgroundColor = [UIColor getColor:@"01B7EE"];
        shopLbl.textColor = COLOR;
        shopLbl.font = [UIFont systemFontOfSize:12];
        [self addSubview:shopLbl];
        
        ordersLbl = [[UILabel alloc]init];
        ordersLbl.text = @"接单：21单";
        //        ageLbl.backgroundColor = [UIColor getColor:@"01B7EE"];
        ordersLbl.textColor = COLOR;
        ordersLbl.textAlignment = 2;
        ordersLbl.font = [UIFont systemFontOfSize:12];
        [self addSubview:ordersLbl];
        
        nearLbl = [[UILabel alloc]init];
        nearLbl.text = @"1.5km";
        //        ageLbl.backgroundColor = [UIColor getColor:@"01B7EE"];
        nearLbl.textColor = COLOR;
        nearLbl.textAlignment = 2;
        nearLbl.font = [UIFont systemFontOfSize:12];
        [self addSubview:nearLbl];
   
        
        NSLog(@"www == %f",self.frame.size.width);
        
        if ([[NSNumber numberWithFloat:self.frame.size.width] intValue] == 320) {
        
            rView = [[LHRatingView alloc]initWithFrame:CGRectMake(self.frame.size.width-110, 0, 100, 25)];
            
        }
        else if ([[NSNumber numberWithFloat:self.frame.size.width] intValue] > 320)
        {
            rView = [[LHRatingView alloc]initWithFrame:CGRectMake(self.frame.size.width, 10, 100, 25)];
        }
        else
        {
        
        }
        
        rView.backgroundColor = [UIColor clearColor];
        rView.userInteractionEnabled = NO;
        rView.score = 4.5;
        [self addSubview:rView];
        
        
        self.imageView.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(self,10)
        .widthIs(85)
        .bottomSpaceToView(self,10);
        
        self.nameLbl.sd_layout
        .topSpaceToView(self,10)
        .leftSpaceToView(imageView,10)
        .rightSpaceToView(self,10)
        .heightIs(10);
        
        self.typeLbl.sd_layout
        .topSpaceToView(nameLbl,10)
        .leftSpaceToView(imageView,10)
        .widthIs(40)
        .heightIs(30);
        
        self.ageLbl.sd_layout
        .leftSpaceToView(typeLbl,10)
        .widthIs(40)
        .topSpaceToView(nameLbl,10)
        .heightIs(30);
        
        sexImg.sd_layout
        .leftSpaceToView(ageLbl,5)
        .topSpaceToView(ageLbl,7)
        .widthIs(15)
        .heightIs(15);
        
        shopLbl.sd_layout
        .leftSpaceToView(imageView,10)
        .widthIs(self.frame.size.width/2)
        .topSpaceToView(ageLbl,10)
        .bottomSpaceToView(self,10);
        
        ordersLbl.sd_layout
        .topSpaceToView(rView,20)
        .rightSpaceToView(self,10)
        .widthIs(200)
        .heightIs(20);
        
        nearLbl.sd_layout
        .bottomSpaceToView(self,10)
        .rightSpaceToView(self,10)
        .widthIs(200)
        .heightIs(20);
    }
    return self;
}

- (void)getTechnicianMode:(TechnicianMode *)mode
{
    [imageView setImageURL:[NSURL URLWithString:mode.headimgurl]];
    nameLbl.text = mode.name;
//    typeLbl.text = mode.type;
//    ageLbl.text = mode.age;
//    shopLbl.text = mode.shopName;
//    ordersLbl.text = [NSString stringWithFormat:@"接单：%@单",mode.orderqty];
//    nearLbl.text = [NSString stringWithFormat:@"%@km",mode.distance];
//    rView.score = [mode.score floatValue];

     NSDictionary *attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:13],};
    CGSize textSize = [typeLbl.text boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    
//    if ([mode.sex isEqualToString:@"男"]) {
//         sexImg.image = [UIImage imageNamed:@"man"];
//        ageLbl.layer.backgroundColor = [UIColor colorWithRed:1/255.0 green:183/255.0 blue:238/255.0 alpha:1].CGColor;
//        ageLbl.layer.borderColor = [UIColor colorWithRed:1/255.0 green:183/255.0 blue:238/255.0 alpha:1].CGColor;
//    }
//    else
//    {
//        sexImg.image = [UIImage imageNamed:@"woman"];
//        ageLbl.layer.backgroundColor = [UIColor colorWithRed:250/255.0 green:84/255.0 blue:227/255.0 alpha:1].CGColor;
//        ageLbl.layer.borderColor = [UIColor colorWithRed:250/255.0 green:84/255.0 blue:227/255.0 alpha:1].CGColor;
//    }
//    
//    shopLbl.text = mode.shopName;

    self.typeLbl.sd_layout
    .topSpaceToView(nameLbl,10)
    .leftSpaceToView(imageView,10)
    .widthIs(textSize.width+10)
    .heightIs(30);
    
    self.ageLbl.sd_layout
    .leftSpaceToView(typeLbl,10)
    .widthIs(40)
    .topSpaceToView(nameLbl,10)
    .heightIs(30);
    
    sexImg.sd_layout
    .leftSpaceToView(ageLbl,5)
    .topSpaceToView(ageLbl,7)
    .widthIs(15)
    .heightIs(15);
    
    shopLbl.sd_layout
    .leftSpaceToView(imageView,10)
    .widthIs(self.frame.size.width/2)
    .topSpaceToView(ageLbl,10)
    .bottomSpaceToView(self,10);
    
    ordersLbl.sd_layout
    .topSpaceToView(rView,20)
    .rightSpaceToView(self,10)
    .widthIs(200)
    .heightIs(20);
    
    nearLbl.sd_layout
    .bottomSpaceToView(self,10)
    .rightSpaceToView(self,10)
    .widthIs(200)
    .heightIs(20);
   
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
