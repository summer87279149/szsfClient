//
//  UIViewController+isUserInfoExist.h
//  foot
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (isUserInfoExist)
-(void)doThisIfUserInfoExist:(void(^)())hander;

@end