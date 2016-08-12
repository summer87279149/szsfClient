//
//  bottonBtn.m
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "bottonBtn.h"

@implementation bottonBtn

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.showsTouchWhenHighlighted = YES;
        self.imageview = [[UIImageView alloc]initWithImage:self.image];
        [self addSubview:self.imageview];
        self.imageview.sd_layout.widthIs(25*k_scale).heightIs(23*k_scale).centerYEqualToView(self).xIs(5);
       
        
        self.name = [UILabel sharedWithFont:12 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self addSubview: self.name];
        self.name.sd_layout.leftSpaceToView(self.imageview,3).centerYEqualToView(self.imageview).heightIs(16).widthIs(48*k_scale);
        
        self.number = [UILabel sharedWithFont:12 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self addSubview:self.number];
        self.number.sd_layout.leftSpaceToView(self.name,0).centerYEqualToView(self.imageview).heightIs(16).rightSpaceToView(self,0);
    }
    return self;
}

@end
