//
//  ShopTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ShopTableViewCell.h"
#import "LHRatingView.h"
#import "EGOImageView.h"

@interface ShopTableViewCell()
{
    EGOImageView *imageView;
    UILabel *titleLbl;
    UILabel *descriptionLbl;
    UILabel *priceLbl;
    UIButton *arrowBtn;
    UILabel *starLbl;
    UILabel *nearLbl;
    LHRatingView *rView;
    NSIndexPath *index;
}
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLbl;
@property(nonatomic,strong)UILabel *descriptionLbl;
@property(nonatomic,strong)UILabel *priceLbl;
@property(nonatomic,strong)UIButton *arrowBtn;
@property(nonatomic,strong)UILabel *starLbl;
@property(nonatomic,strong)UILabel *nearLbl;
@property(nonatomic,strong)LHRatingView *rView;
@end

@implementation ShopTableViewCell
@synthesize imageView,titleLbl,descriptionLbl,priceLbl,arrowBtn,rView,starLbl,nearLbl,shopCel_delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.imageView = [[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"smallDefualt.png"]];;
        imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:imageView];
        
        self.titleLbl = [[UILabel alloc]init];
        titleLbl.text = @"扬子江路门市店";
        titleLbl.font = [UIFont boldSystemFontOfSize:14];
        titleLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLbl];
        
        self.descriptionLbl =  [[UILabel alloc]init];
        descriptionLbl.text = @"店铺描述。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。";
        descriptionLbl.backgroundColor = [UIColor clearColor];
        descriptionLbl.textColor = COLOR;
        descriptionLbl.font = [UIFont boldSystemFontOfSize:12];
        descriptionLbl.numberOfLines = 1;
        [self addSubview:descriptionLbl];
        
        self.starLbl =  [[UILabel alloc]init];
        starLbl.text = @"4.5分";
        starLbl.backgroundColor = [UIColor clearColor];
        starLbl.textColor = COLOR;
        starLbl.font = [UIFont boldSystemFontOfSize:12];
        starLbl.numberOfLines = 1;
        [self addSubview:starLbl];
        
        self.priceLbl = [[UILabel alloc]init];
        priceLbl.text = @"￥99";
        priceLbl.backgroundColor = [UIColor clearColor];
        priceLbl.textColor = COLOR;
        priceLbl.textAlignment = 2;
        priceLbl.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:priceLbl];
        
        self.nearLbl =  [[UILabel alloc]init];
        nearLbl.text = @"1.5km";
        nearLbl.backgroundColor = [UIColor clearColor];
        nearLbl.textColor = COLOR;
        nearLbl.font = [UIFont boldSystemFontOfSize:12];
        nearLbl.textAlignment = 2;
        [self addSubview:nearLbl];
        
        arrowBtn = [[UIButton alloc]init];
        [arrowBtn setBackgroundColor:[UIColor clearColor]];
//        [arrowBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        arrowBtn.titleLabel.textAlignment = 1;
        [arrowBtn setImage:[UIImage imageNamed:@"arrowL"] forState:UIControlStateNormal];
        [arrowBtn addTarget:self action:@selector(arrowBtnPress) forControlEvents:UIControlEventTouchUpInside];
//        [arrowBtn setTitle:@"预约" forState:UIControlStateNormal];
        [self addSubview:arrowBtn];
        
        rView = [[LHRatingView alloc]initWithFrame:CGRectMake(125, 25, 100, 25)];
        rView.backgroundColor = [UIColor clearColor];
        rView.userInteractionEnabled = NO;
        rView.score = 4.5;
        [self addSubview:rView];
        
        self.imageView.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(self,10)
        .widthIs(120)
        .bottomSpaceToView(self,20);

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
        .heightIs(20);
        
        
        rView.sd_layout
        .topSpaceToView(descriptionLbl,5)
        .leftSpaceToView(imageView,5)
        .heightIs(30);
        
        starLbl.sd_layout
        .topSpaceToView(descriptionLbl,5)
        .leftSpaceToView(rView,15)
        .widthIs(40)
        .heightIs(30);

        self.arrowBtn.sd_layout
        .centerXEqualToView(self)
        .bottomSpaceToView(self,0)
        .widthIs(30)
        .heightIs(20);
        
        nearLbl.sd_layout
        .bottomSpaceToView(self,0)
        .rightSpaceToView(self,10)
        .widthIs(80)
        .heightIs(20);
        
        
//        UIImageView *lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 109, self.frame.size.width, 1)];
//        lineImg.backgroundColor = [UIColor lightGrayColor];
//        [self addSubview:lineImg];
    }
    return self;
}

- (void)getData:(NSIndexPath *)path
{
    index = path;

}

- (void)getDataModel:(ShopMode *)mode
{
    titleLbl.text = mode.shopName;
    [imageView setImageURL:[NSURL URLWithString:mode.shopImagesURL]];
    descriptionLbl.text = mode.shopInfo;
    starLbl.text = [NSString stringWithFormat:@"%@分",mode.shopScore];
    priceLbl.text = [NSString stringWithFormat:@"￥%@",mode.shopFloorprice];
    nearLbl.text = [NSString stringWithFormat:@"%@km",mode.shopDistance];
    rView.score = [mode.shopScore floatValue];
}

 - (void)arrowBtnPress
{
    if (self.shopCel_delegate && [self.shopCel_delegate respondsToSelector:@selector(sendIndexPath:)]) {
        [self.shopCel_delegate sendIndexPath:index];
    }
     NSLog(@"index == %ld",(long)index.row);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
