//
//  KeyInputView.m
//  都市摇摇看
//
//  Created by admin on 15/12/4.
//  Copyright © 2015年 hackcc. All rights reserved.
//

#import "KeyInputView.h"

@implementation KeyInputView

+ (instancetype)keyInputView {

    return [[[NSBundle mainBundle] loadNibNamed:@"KeyInputView" owner:nil options:nil] lastObject];
}

- (IBAction)overBtnClick:(UIButton *)sender {
    
    self.keyBlock(self);
    
}


@end
