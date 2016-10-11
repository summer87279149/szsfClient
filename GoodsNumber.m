//
//  GoodsNumber.m
//  foot
//
//  Created by Admin on 16/8/14.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "GoodsNumber.h"

@implementation GoodsNumber


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        self.counts = 1;
        self.decresBtn = [[UIButton alloc]init];
        [self.decresBtn setTitle:@"－" forState:UIControlStateNormal];
        [self addSubview:self.decresBtn];
        self.decresBtn.backgroundColor = [UIColor clearColor];
        [self.decresBtn setTitleColor:COLOR forState:UIControlStateNormal];
        self.decresBtn.sd_layout.topEqualToView(self).bottomEqualToView(self).leftEqualToView(self).widthRatioToView(self,0.3);
        [self.decresBtn addTarget:self action:@selector(decresBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView *line1 = [UIView lineWithColor:COLOR];
        [self addSubview:line1];
        line1.sd_layout.widthIs(1).topEqualToView(self).bottomEqualToView(self).leftSpaceToView(self.decresBtn,0);
        
        
        self.incresBtn = [[UIButton alloc]init];
        [self.incresBtn setTitle:@"＋" forState:UIControlStateNormal];
        [self.incresBtn setTitleColor:COLOR forState:UIControlStateNormal];
        [self addSubview:self.incresBtn];
        self.incresBtn.backgroundColor = [UIColor clearColor];
        [self.incresBtn addTarget:self action:@selector(incresBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.incresBtn.sd_layout.topEqualToView(self).bottomEqualToView(self).rightEqualToView(self).widthRatioToView(self,0.3);
        
        
        UIView *line2 = [UIView lineWithColor:COLOR];
        [self addSubview:line2];
        line2.sd_layout.widthIs(1).topEqualToView(self).bottomEqualToView(self).rightSpaceToView(self.incresBtn,0);
        
        
        self.countsLab = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:center andBackgroundColor:nil];
        [self addSubview:self.countsLab];
        self.countsLab.sd_layout.topEqualToView(self).bottomEqualToView(self).leftSpaceToView(self.decresBtn,0).rightSpaceToView(self.incresBtn,0);
        self.countsLab.backgroundColor = [UIColor clearColor];
        self.countsLab.text = [NSString stringWithFormat:@"%d",self.counts];
        self.layer.cornerRadius = 4;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [COLOR CGColor];
    }
    return self;
}


-(void)decresBtnClicked:(UIButton *)button{
    if (self.counts==1) {
        return;
    }else{
    self.counts--;
    self.countsLab.text = [NSString stringWithFormat:@"%d",self.counts];
    [_delegate BtnClicked];
    }
}


-(void)incresBtnClicked:(UIButton *)button{
    self.counts++;
    self.countsLab.text = [NSString stringWithFormat:@"%d",self.counts];
    [_delegate BtnClicked];

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
