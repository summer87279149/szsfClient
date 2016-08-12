//
//  CollectionViewCell.m
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        
        self.image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MallImage"]];
        [self addSubview: self.image];
        self.image.sd_layout.topSpaceToView(self,3).leftSpaceToView(self,3).rightSpaceToView(self,3).bottomSpaceToView(self,self.bounds.size.height/3);
        
        
        self.name = [[UILabel alloc]init];
        self.name.textColor = COLOR;
        self.name.font = [UIFont systemFontOfSize:14];
        self.name.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.name];
        self.name.sd_layout.widthIs(self.frame.size.width/2).xIs(3).topSpaceToView(self.image,0).heightIs(self.frame.size.height/6);
        
        
        self.contentSize = [[UILabel alloc]init];
        [self addSubview:self.contentSize];
        self.contentSize.textColor = COLOR;
        self.contentSize.font = [UIFont systemFontOfSize:14];
        self.contentSize.textAlignment = NSTextAlignmentRight;
        self.contentSize.adjustsFontSizeToFitWidth = YES;
        self.contentSize.sd_layout.rightSpaceToView(self,3).centerYEqualToView(self.name).widthIs(self.frame.size.width/2).heightIs(self.frame.size.height/6);
        
        self.huiyuanjia = [[UILabel alloc]init];
        [self addSubview:self.huiyuanjia];
        self.huiyuanjia.textColor = COLOR;
        self.huiyuanjia.text = @"会员价:";
        self.huiyuanjia.font = [UIFont systemFontOfSize:14];
        self.huiyuanjia.adjustsFontSizeToFitWidth = YES;
        self.huiyuanjia.sd_layout.xIs(3).topSpaceToView(self.name,0).heightIs(self.frame.size.height/6).widthIs(self.frame.size.width/3);
        
        self.price = [[UILabel alloc]init];
        [self addSubview:self.price];
        self.price.textColor = [UIColor getColor:@"A0974D"];
        self.price.textAlignment = NSTextAlignmentRight;
        self.price.font = [UIFont systemFontOfSize:15];
        self.price.adjustsFontSizeToFitWidth = YES;
        self.price.sd_layout.centerYEqualToView(self.huiyuanjia).rightSpaceToView(self,3).heightIs(self.frame.size.height/6).widthIs(self.frame.size.width/3);
        
        
        
        self.name.text = @"多乐士袋装茶";
        self.contentSize.text = @"20g*20袋";
        self.price.text = @"150元";

    }
    return self;
}
@end
