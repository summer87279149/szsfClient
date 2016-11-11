//
//  YCUserModel.m
//  YCWM
//
//  Created by 李帅 on 15/2/2.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "YCUserModel.h"
#import <CoreFoundation/CoreFoundation.h>

@implementation YCUserModel
+(instancetype)shareManager
{
    static YCUserModel *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YCUserModel alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}



- (void)save{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if (self.token) {
        [ud setObject:self.token forKey:USER_TOKEN];
    }
    
    if (self.userName) {
        [ud setObject:self.userName forKey:USER_NAME];
    }
    
    if (self.password) {
        [ud setObject:self.password forKey:USER_PASSWORD];
    }
    
    if (self.userStates) {
        [ud setObject:self.userStates forKey:USER_STATUS];
    }
    
    if (self.userId) {
        [ud setObject:self.userId forKey:USER_ID];
    }
    if (self.phoneNumber) {
        [ud setObject:self.phoneNumber forKey:USER_PHONE];
    }
    
    if (self.latitude) {
        [ud setObject:self.latitude forKey:USER_LA];
    }
    if (self.longitude) {
        [ud setObject:self.longitude forKey:USER_LO];
    }
    
    if (self.position) {
        [ud setObject:self.position forKey:USER_Position];
    }
    
    if (self.city) {
        [ud setObject:self.city forKey:USER_City];
    }
    
    [ud synchronize];
}

+ (NSString *)userToken{
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN];
    
    if ([self didLogin]) {
        token = [token stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        token = nil;
    }
    
    return token;
}

+ (NSString *)userStatus{
    NSString *userStatus = [[NSUserDefaults standardUserDefaults] objectForKey:USER_STATUS];
    
    return userStatus;
}

+ (NSString *)username{
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    
    return username;
}
+ (NSString *)phoneNumber{
    
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PHONE];
    
    return  phoneNumber;
}
+ (NSString *)password{
    
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWORD];
    
    return password;
}

+ (NSString *)userId{
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:USER_ID];
//    
//    if (userId==nil) {
//        UIViewController *currentVC = [self getCurrentVC];
//        [UIApplication sharedApplication].keyWindow.rootViewController=currentVC;
//    }
    return userId;
}

#pragma mark 获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC{
    // 定义一个变量存放当前屏幕显示的viewcontroller
    UIViewController *result = nil;
    // 得到当前应用程序的主要窗口
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    // windowLevel是在 Z轴 方向上的窗口位置，默认值为UIWindowLevelNormal
    if (window.windowLevel != UIWindowLevelNormal)    {
        // 获取应用程序所有的窗口
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {            // 找到程序的默认窗口（正在显示的窗口）
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {                // 将关键窗口赋值为默认窗口
                window = tmpWin;
                break;
            }
        }
    }
    // 获取窗口的当前显示视图
    UIView *frontView = [[window subviews] objectAtIndex:0];
    // 获取视图的下一个响应者，UIView视图调用这个方法的返回值为UIViewController或它的父视图
    id nextResponder = [frontView nextResponder];
    // 判断显示视图的下一个响应者是否为一个UIViewController的类对象
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}
+ (NSString *)latitude
{
    NSString *latitude = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LA];
    
    return latitude;
}

+ (NSString *)longitude
{
    NSString *longitude = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LO];
    
    return longitude;
}

+ (NSString *)position{
    
    NSString *position = [[NSUserDefaults standardUserDefaults] objectForKey:USER_Position];
    
    return position;
}

+ (NSString *)city
{
    NSString *city = [[NSUserDefaults standardUserDefaults] objectForKey:USER_City];
    return city;
}

+ (BOOL)didLogin{
    
    BOOL login = NO;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud objectForKey:USER_PHONE] && [ud objectForKey:USER_PASSWORD]) {
        login = YES;
    }
    
    return login;
}

- (void)logOut{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:nil forKey:USER_NAME];
    [ud setObject:nil forKey:USER_PASSWORD];
    [ud setObject:nil forKey:USER_TOKEN];
    [ud setObject:nil forKey:USER_STATUS];
    [ud setObject:nil forKey:USER_ID];
    [ud setObject:nil forKey:USER_PHONE];
    [ud setObject:nil forKey:USER_LA];
    [ud setObject:nil forKey:USER_LO];
    [ud setObject:nil forKey:USER_Position];
    [ud synchronize];
}

+ (void)alertWithTitle:(NSString *)title{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
