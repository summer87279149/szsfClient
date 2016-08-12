//
//  MyCollectionViewCell.m
//  FootMassage
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.image = [[UIImageView alloc]init];
        [self addSubview: self.image];
        self.image.sd_layout.topSpaceToView(self,3).leftSpaceToView(self,3).rightSpaceToView(self,3).bottomSpaceToView(self,self.bounds.size.height/3);
        self.name = [[UILabel alloc]init];
        self.name.textColor = COLOR;
        self.name.font = [UIFont systemFontOfSize:15];
        self.name.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.name];
        self.name.sd_layout.widthIs(self.frame.size.width-6).xIs(3).topSpaceToView(self.image,0).heightIs(self.frame.size.height/6);
        
        self.time = [[UILabel alloc]init];
        [self addSubview:self.time];
        self.time.textColor = COLOR;
        self.time.font = [UIFont systemFontOfSize:11];
        self.time.adjustsFontSizeToFitWidth = YES;
        self.time.sd_layout.xIs(3).topSpaceToView(self.name,0).heightIs(self.frame.size.height/6).widthIs(self.frame.size.width/3);
        
        self.chooseNumber = [[UILabel alloc]init];
        [self addSubview:self.chooseNumber];
        self.chooseNumber.textColor = COLOR;
        self.chooseNumber.font = [UIFont systemFontOfSize:11];
        self.chooseNumber.adjustsFontSizeToFitWidth = YES;
        self.chooseNumber.sd_layout.centerXEqualToView(self).centerYEqualToView(self.time).heightIs(self.frame.size.height/6).widthIs(self.frame.size.width/3);
        
        self.price = [[UILabel alloc]init];
        [self addSubview:self.price];
        self.price.textColor = [UIColor getColor:@"A0974D"];
        self.price.textAlignment = NSTextAlignmentRight;
        self.price.font = [UIFont systemFontOfSize:15];
        self.price.adjustsFontSizeToFitWidth = YES;
        self.price.sd_layout.centerYEqualToView(self.time).rightSpaceToView(self,3).heightIs(self.frame.size.height/6).widthIs(self.frame.size.width/3);
        
    }
    return self;
}
@end
