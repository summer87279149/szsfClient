//
//  HomeTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/25.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "EGOImageView.h"

@interface HomeTableViewCell()
{
    EGOImageView *imgView;
    UILabel *nameLbl;              //项目名称
    UILabel *infoLbl;              //描述
    UILabel *consumptionLbl;       //消费或店名
    UILabel *nearbyLbl;             //距离或从业年限
    UILabel *numberLbl;             //人员选择
    UIImageView *backgroundImageView;
    UIImage *backgroundImage;
}
@end

@implementation HomeTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        backgroundImage = [UIImage imageNamed:@"homeVCBackgroundImage"];
        backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
//        backgroundImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self addSubview:backgroundImageView];
        // Initialization code
        imgView = [[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"placeholder"]];
        imgView.backgroundColor = [UIColor getColor:@"4DB748"];
        [self addSubview:imgView];
        
        nameLbl = [[UILabel alloc]init];
        nameLbl.text = @"虹桥养生堂江平路店";
        nameLbl.textAlignment = NSTextAlignmentRight;
        
        
        nameLbl.font = [UIFont boldSystemFontOfSize:14];
        nameLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:nameLbl];
        
        infoLbl = [[UILabel alloc]init];
        infoLbl.text = @"";
        infoLbl.textAlignment = NSTextAlignmentRight;
        infoLbl.textColor = [UIColor blackColor];
        infoLbl.font = [UIFont systemFontOfSize:14];
        infoLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:infoLbl];
        
        consumptionLbl = [[UILabel alloc]init];
        consumptionLbl.text = @"人均消费：70元";
        consumptionLbl.textColor = [UIColor blackColor];
        consumptionLbl.font = [UIFont systemFontOfSize:14];
        consumptionLbl.backgroundColor = [UIColor clearColor];
//        [self addSubview:consumptionLbl];
        
        nearbyLbl = [[UILabel alloc]init];
        nearbyLbl.text = @"1.5km";
        nearbyLbl.textColor = [UIColor blackColor];
        nearbyLbl.textAlignment = 2;
        nearbyLbl.font = [UIFont systemFontOfSize:14];
        nearbyLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:nearbyLbl];
        
        numberLbl = [[UILabel alloc]init];
        numberLbl.text = @"已有375人选择";
        numberLbl.textColor = [UIColor blackColor];
        numberLbl.textAlignment = 2;
        numberLbl.font = [UIFont systemFontOfSize:14];
        numberLbl.backgroundColor = [UIColor clearColor];
//        [self addSubview:numberLbl];
        
        
        UIImageView *topimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"探号店"]];
        topimageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:topimageView];

        backgroundImageView.sd_layout
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .topSpaceToView(self,0)
        .bottomSpaceToView(self,0);
        
        imgView.sd_layout
        .leftSpaceToView(self,20)
        .topSpaceToView(self,5)
        .rightSpaceToView(self,20)
        .heightIs(200);
        
        consumptionLbl.sd_layout
        .leftSpaceToView(self,20)
        .topSpaceToView(infoLbl,5)
        .rightSpaceToView(self,150)
        .heightIs(20);
        
        nearbyLbl.sd_layout
        .rightSpaceToView(self,20)
        .topSpaceToView(imgView,5)
        .heightIs(20);
        
        nameLbl.sd_layout
        .topSpaceToView(nearbyLbl,5)
        .rightSpaceToView(self,20)
        .heightIs(20);
        
        infoLbl.sd_layout
        .topSpaceToView(nameLbl,5)
        .rightSpaceToView(self,20)
        .heightIs(20);
        
        numberLbl.sd_layout
        .rightSpaceToView(self,20)
        .topSpaceToView(infoLbl,5)
        .leftSpaceToView(consumptionLbl,10)
        .heightIs(20);
        
        
        topimageView.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(80)
        .widthIs(80)
        .bottomSpaceToView(self,0);

    }
    return self;
}

- (void)sendType:(NSString *)typeStr
{
    if ([typeStr isEqualToString:@"名店推荐"]) {
        nameLbl.text = @"虹桥养生堂江平路店";
        infoLbl.text = @"";
        consumptionLbl.text = @"人均消费：70元";
        nearbyLbl.text = @"1.5km";
//        numberLbl.text = @"已有375人选择";
        numberLbl.attributedText = [self createRiviewAttributedPriceString:@"已有" AndStringTwo:@"375"];
    }
    else
    {
        nameLbl.text = @"谭某某";
        infoLbl.text = @"擅长足疗、按摩、推拿";
        consumptionLbl.text = @"虹桥养生会所";
//        nearbyLbl.text = @"从业20年";
         nearbyLbl.attributedText = [self createPractitionersString:@"从业" AndStringTwo:@"20"];
//        numberLbl.text = @"已有600人选择";
        numberLbl.attributedText = [self createRiviewAttributedPriceString:@"已有" AndStringTwo:@"375"];
    }
}

//从业年限
- (NSMutableAttributedString *)createPractitionersString:(NSString *)strOne AndStringTwo:(NSString *)strTwo
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@年",strOne,strTwo]];
    NSInteger locationIndex = strOne.length;
    NSInteger lengthIndex = strTwo.length;
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0,locationIndex)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0,locationIndex)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(locationIndex,lengthIndex)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor getColor:@"FB5454"] range:NSMakeRange(locationIndex,lengthIndex)];
    return attString;
}

//人员选择
- (NSMutableAttributedString *)createRiviewAttributedPriceString:(NSString *)strOne AndStringTwo:(NSString *)strTwo
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@人选择",strOne,strTwo]];
    NSInteger locationIndex = strOne.length;
    NSInteger lengthIndex = strTwo.length;
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0,locationIndex)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0,locationIndex)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(locationIndex,lengthIndex)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor getColor:@"FB5454"] range:NSMakeRange(locationIndex,lengthIndex)];
    return attString;
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
