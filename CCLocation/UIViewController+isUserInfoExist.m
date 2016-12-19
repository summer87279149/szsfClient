//
//  UIViewController+isUserInfoExist.m
//  foot
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "UIViewController+isUserInfoExist.h"

@implementation UIViewController (isUserInfoExist)
-(void)doThisIfUserInfoExist:(void(^)())hander{
    if ([YCUserModel userId]) {
        hander();
    }else{
        UserLoginController *a = [[UserLoginController alloc]init];
        UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:a];
        naVC.navigationBar.translucent = NO;
        [self.navigationController presentViewController:naVC animated:YES completion:nil];
        
    }
    
}
@end
