//
//  ProjectTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ProjectTableViewCell.h"
#import "EGOImageView.h"

@interface ProjectTableViewCell()
{
    EGOImageView *imageView;
    UILabel *titleLbl;
    UILabel *descriptionLbl;
    UILabel *priceLbl;
    UIButton *reserveBtn;
    NSIndexPath *index;
}
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLbl;
@property(nonatomic,strong)UILabel *descriptionLbl;
@property(nonatomic,strong)UILabel *priceLbl;
@property(nonatomic,strong)UIButton *reserveBtn;
@end

@implementation ProjectTableViewCell
@synthesize imageView,titleLbl,descriptionLbl,priceLbl,reserveBtn,proCel_delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

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
        
        self.imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"smallDefualt.png"]];
        imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:imageView];
        
        self.titleLbl = [[UILabel alloc]init];
        titleLbl.text = @"足疗";
        titleLbl.font = [UIFont boldSystemFontOfSize:13];
        titleLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLbl];
        
        self.descriptionLbl =  [[UILabel alloc]init];
        descriptionLbl.text = @"项目描述。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。";
        descriptionLbl.backgroundColor = [UIColor clearColor];
        descriptionLbl.textColor = [UIColor blackColor];
        descriptionLbl.font = [UIFont boldSystemFontOfSize:12];
        descriptionLbl.numberOfLines = 2;
        [self addSubview:descriptionLbl];
        
        self.priceLbl = [[UILabel alloc]init];
        priceLbl.text = @"￥99起 ";
        priceLbl.backgroundColor = [UIColor clearColor];
        priceLbl.textColor = COLOR;
        priceLbl.font = [UIFont boldSystemFontOfSize:13];
        [self addSubview:priceLbl];
        
        reserveBtn = [[UIButton alloc]init];
        [reserveBtn setBackgroundColor:COLOR];
        [reserveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        reserveBtn.titleLabel.textAlignment = 1;
        [reserveBtn setTitle:@"预约" forState:UIControlStateNormal];
        [reserveBtn addTarget:self action:@selector(reservePress) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:reserveBtn];
        
        self.imageView.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(self,10)
        .widthIs(120)
        .bottomSpaceToView(self,10);
        
        self.titleLbl.sd_layout
        .topSpaceToView(self,10)
        .leftSpaceToView(imageView,5)
        .rightSpaceToView(self,10)
        .heightIs(10);
        
        self.descriptionLbl.sd_layout
        .topSpaceToView(titleLbl,5)
        .leftSpaceToView(imageView,5)
        .rightSpaceToView(self,10)
        .heightIs(40);
        
        self.priceLbl.sd_layout
        .leftSpaceToView(imageView,5)
        .bottomSpaceToView(self,10)
        .widthIs(200)
        .topSpaceToView(descriptionLbl,5);

        self.reserveBtn.sd_layout
        .rightSpaceToView(self,10)
        .bottomSpaceToView(self,10)
        .widthIs(100)
        .topSpaceToView(descriptionLbl,5);
    }
    return self;
}

- (void)getData:(NSIndexPath *)path
{
    index = path;
    
}

- (void)reservePress
{
    if (self.proCel_delegate && [self.proCel_delegate respondsToSelector:@selector(sendReserveTag:)]) {
        [self.proCel_delegate sendReserveTag:index];
    }
    NSLog(@"index == %ld",(long)index.row);
}

- (void)getDataModel:(ProjectModel *)mode
{
    titleLbl.text = mode.projectName;
    [imageView setImageURL:[NSURL URLWithString:mode.imageURL]];
    descriptionLbl.text = mode.services;
    priceLbl.text = [NSString stringWithFormat:@"￥%@起",mode.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
