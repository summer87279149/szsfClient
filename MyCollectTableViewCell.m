//
//  MyCollectTableViewCell.m
//  foot
//
//  Created by Admin on 16/11/4.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MyCollectTableViewCell.h"

@implementation MyCollectTableViewCell

@synthesize imageView,titleLbl,descriptionLbl,priceLbl,arrowBtn,rView,starLbl,nearLbl;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ToShopCellBG"]];
        imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:imageView];
        
        self.titleLbl = [[UILabel alloc]init];
        titleLbl.text = @"";
        titleLbl.font = [UIFont boldSystemFontOfSize:14];
        titleLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLbl];
        
        self.descriptionLbl =  [[UILabel alloc]init];
        descriptionLbl.text = @"";
        descriptionLbl.backgroundColor = [UIColor clearColor];
        descriptionLbl.textColor = COLOR;
        descriptionLbl.font = [UIFont boldSystemFontOfSize:10];
        descriptionLbl.numberOfLines = 0;
        descriptionLbl.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:descriptionLbl];
        
        self.starLbl =  [[UILabel alloc]init];
        starLbl.text = @"";
        starLbl.backgroundColor = [UIColor clearColor];
        starLbl.textColor = COLOR;
        starLbl.font = [UIFont boldSystemFontOfSize:12];
        starLbl.numberOfLines = 1;
        [self addSubview:starLbl];
        
        self.priceLbl = [[UILabel alloc]init];
        priceLbl.text = @"";
        priceLbl.backgroundColor = [UIColor clearColor];
        priceLbl.textColor = COLOR;
        priceLbl.textAlignment = 2;
        priceLbl.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:priceLbl];
        
        self.nearLbl =  [[UILabel alloc]init];
        nearLbl.text = @"";
        nearLbl.backgroundColor = [UIColor clearColor];
        nearLbl.textColor = COLOR;
        nearLbl.font = [UIFont boldSystemFontOfSize:12];
        nearLbl.textAlignment = 2;
        [self addSubview:nearLbl];
        
        
        
        rView = [[LHRatingView alloc]initWithFrame:CGRectMake(125, 25, 100, 25)];
        rView.backgroundColor = [UIColor clearColor];
        rView.userInteractionEnabled = NO;
        rView.score = 4.5;
        [self addSubview:rView];
        
        self.imageView.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(self,5)
        .widthIs(120)
        .bottomSpaceToView(self,5);
        
        self.titleLbl.sd_layout
        .topSpaceToView(self,10)
        .leftSpaceToView(imageView,5)
        .widthIs(self.frame.size.width/2-30)
        .heightIs(20);
        
        self.priceLbl.sd_layout
        .leftSpaceToView(titleLbl,5)
        .rightSpaceToView(self,10)
        .topSpaceToView(self,10)
        .heightIs(20);
        
        self.descriptionLbl.sd_layout
        .topSpaceToView(titleLbl,5)
        .leftSpaceToView(imageView,5)
        .rightSpaceToView(self,10)
        .heightIs(25);
        
        
        rView.sd_layout
        .topSpaceToView(descriptionLbl,5)
        .leftSpaceToView(imageView,5)
        .heightIs(30);
        
        starLbl.sd_layout
        .topSpaceToView(descriptionLbl,2)
        .leftSpaceToView(rView,15)
        .widthIs(40)
        .heightIs(30);
        
        
        nearLbl.sd_layout
        .bottomSpaceToView(self,0)
        .rightSpaceToView(self,10)
        .widthIs(80)
        .heightIs(20);
    }
    return self;
}
-(void)setMyCollectionModel:(MyCollectionModel *)myCollectionModel{
    _myCollectionModel = myCollectionModel;
    [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",myCollectionModel.imageUrl]]];
    titleLbl.text = myCollectionModel.name;
    descriptionLbl.text = myCollectionModel.descrip;
    priceLbl.text = [NSString stringWithFormat:@"均价¥:%@",myCollectionModel.price];
    rView.score = myCollectionModel.star;
    starLbl.text = [NSString stringWithFormat:@"%.1f分",myCollectionModel.star];
//    nearLbl.text = [NSString stringWithFormat:@"%@km",myCollectionModel.near];
//    NSLog(@"=============%@,%@,%@,%@,%@",titleLbl.text ,descriptionLbl.text,priceLbl.text,starLbl.text,nearLbl.text);
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
