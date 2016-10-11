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
        self.name.text = @"***********";
        [self addSubview:self.name];
        self.name.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,5*k_scaleHeight).heightIs(15*k_scaleHeight).widthIs(200);
        
        
        //评论
        self.comments = [UILabel sharedWithFont:11 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        self.comments.frame = CGRectMake(10, 0, kScreenWidth*2/3, 200);
        [self addSubview:self.comments];
        self.comments.lineBreakMode = NSLineBreakByCharWrapping;
        self.comments.numberOfLines = 0;
        self.comments.text = @"＊＊＊＊＊＊＊＊＊＊";
        CGSize size = [self.comments sizeThatFits:CGSizeMake(self.comments.frame.size.width, 2000)];
//        NSLog(@"%f",size.height);
        self.comments.sd_layout.leftSpaceToView(self,10).topSpaceToView(self.name,5*k_scaleHeight).heightIs(size.height).widthIs(kScreenWidth*2/3);
   
        
        //项目
        self.project = [UILabel sharedWithFont:12 andColor:[UIColor darkGrayColor] andAnligment:right andBackgroundColor:nil];
        [self addSubview:self.project];
        self.project.sd_layout.rightSpaceToView(self,10).centerYEqualToView(self.name).heightIs(15*k_scaleHeight).widthIs(kScreenWidth-200);
        self.project.text = @"项目：＊＊＊＊＊";
        
        
        //时间
        self.time = [UILabel sharedWithFont:11 andColor:[UIColor darkGrayColor] andAnligment:right andBackgroundColor:nil];
        self.time.text = @"****年＊月＊日";
        [self addSubview:self.time];
        self.time.sd_layout.rightSpaceToView(self,10).topEqualToView(self.comments).heightIs(11*k_scaleHeight).widthIs(kScreenWidth/3);
        
        
        //星星评价
        _star = [[TQStarRatingView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth/3, (kScreenWidth-20)/15) numberOfStar:5];
        [_star setScore:0.5 withAnimation:NO];
        [self addSubview:_star];
        _star.sd_layout.topSpaceToView(self.time,5).rightSpaceToView(self,10).widthIs(kScreenWidth/3).heightIs(kScreenWidth/15);
        _star.userInteractionEnabled = NO;
        
     
        self.height = 41*k_scaleHeight+size.height+10;
//        NSLog(@"%f",self.height);
        
    }
    return self;
}
-(void)setCommentCellModel:(CommentCellModel *)commentCellModel{
    
    _commentCellModel = commentCellModel;
    self.name.text = commentCellModel.name;
    self.comments.text = commentCellModel.commentContent;
    self.project.text = commentCellModel.serviceName;
    self.time.text = commentCellModel.time;
    [self.star setScore:commentCellModel.grade withAnimation:NO];
    
}
@end
