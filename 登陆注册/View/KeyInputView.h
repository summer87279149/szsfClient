//
//  KeyInputView.h
//  都市摇摇看
//
//  Created by admin on 15/12/4.
//  Copyright © 2015年 hackcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyInputView;
typedef void (^KeyInputViewBlock) (KeyInputView *) ;

@interface KeyInputView : UIView

@property (nonatomic, copy) KeyInputViewBlock keyBlock;

+ (instancetype)keyInputView;

@end
