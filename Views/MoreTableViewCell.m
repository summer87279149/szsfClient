//
//  MoreTableViewCell.m
//  FootMassage
//
//  Created by Admin on 16/4/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "EGOImageView.h"

@interface MoreTableViewCell()
{
    UIScrollView *m_contentScrol;
}
@property(nonatomic,strong)UIScrollView *m_contentScrol;
@end

@implementation MoreTableViewCell
@synthesize m_contentScrol,moreCell_deleagte;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        m_contentScrol = [[UIScrollView alloc] init];
        //    m_contentScrol.frame = CGRectMake(0, 0, 250, 250); // frame中的size指UIScrollView的可视范围
        m_contentScrol.backgroundColor = [UIColor clearColor];
        // 隐藏水平滚动条
        //    m_contentScrol.showsHorizontalScrollIndicator = NO;
        //    m_contentScrol.showsVerticalScrollIndicator = YES;
        [self addSubview:m_contentScrol];
        
        m_contentScrol.sd_layout
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .topSpaceToView(self,0)
        .bottomSpaceToView(self,0);
        
        m_contentScrol.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)getDataArr:(NSMutableArray *)imgArr
{
    //去除按钮缓存图片
    for(UIButton *btn  in [m_contentScrol subviews])
    {
        [btn removeFromSuperview];
    }
    
    for (int i = 0;  i < [imgArr count]; i ++) {
  
        EGOImageView *imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"smallDefualt.png"]];
        imageView.backgroundColor = [UIColor clearColor];
        [imageView setImageURL:[NSURL URLWithString:[[imgArr objectAtIndex:i] valueForKey:@"headimgurl"]]];
//        [self addSubview:imageView];
        
         UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(70*i+10, 10, 60, 60)];
        btn.tag = 400+i;
        [btn setBackgroundColor:[UIColor getColor:@"50B74A"]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = 1;
        [btn setImage:imageView.image forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"头像" forState:UIControlStateNormal];
        [m_contentScrol addSubview:btn];
        // 设置UIScrollView的滚动范围
        m_contentScrol.contentSize = CGSizeMake(70*i+10+70, 80);
    }
}

- (void)clickBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (self.moreCell_deleagte && [self.moreCell_deleagte respondsToSelector:@selector(sendBtnTag:)]) {
        [self.moreCell_deleagte sendBtnTag:btn.tag-400];
    }
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
